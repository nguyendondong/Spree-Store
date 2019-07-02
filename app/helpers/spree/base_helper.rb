module Spree
  module BaseHelper

    def is_admin?
      spree_current_user.respond_to?(:has_spree_role?) && spree_current_user.has_spree_role?('admin')
    end

    def mobile?
      if session[:mobile_override]
        session[:mobile_override] == "1"
      else
        request.user_agent.downcase =~ /mobile|android|touch|webos|hpwos/
      end
    end
    #helper_method :mobile?

    # Defined because Rails' current_page? helper is not working when Spree is mounted at root.
    def current_spree_page?(url)
      path = request.fullpath.gsub(/^\/\//, '/')
      if url.is_a?(String)
        return path == url
      elsif url.is_a?(Hash)
        return path == spree.url_for(url)
      end
      return false
    end

    def link_to_cart(text = nil)
      text = text ? h(text) : Spree.t('cart')
      css_class = nil

      if simple_current_order.nil? or simple_current_order.item_count.zero?
        text = "#{text}: (#{Spree.t('empty')})"
        css_class = 'empty'
      else
        text = "#{text}: (#{simple_current_order.item_count})  <span class='amount'>#{simple_current_order.display_total.to_html}</span>"
        css_class = 'full'
      end

      link_to text.html_safe, spree.cart_path, :class => "cart-info #{css_class}"
    end

    # human readable list of variant options
    def variant_options(v, options={})
      v.options_text
    end

    def meta_data
      object = instance_variable_get('@'+controller_name.singularize)
      meta = {}

      if object.kind_of? ActiveRecord::Base
        meta[:keywords] = object.meta_keywords if object[:meta_keywords].present?
        meta[:description] = object.meta_description if object[:meta_description].present?
      end

      if meta[:description].blank? && object.kind_of?(Spree::Product)
        meta[:description] = truncate(strip_tags(object.description), length: 160, separator: ' ')
      end

      meta.reverse_merge!({
        keywords: current_store.meta_keywords,
        description: current_store.meta_description,
      })
      meta
    end

    def meta_data_tags
      meta_data.map do |name, content|
        tag('meta', name: name, content: content)
      end.join("\n")
    end

    def body_class
      @body_class ||= content_for?(:sidebar) ? 'two-col' : 'one-col'
      @body_class
    end

    def logo(image_path=Spree::Config[:logo])
      link_to image_tag(image_path), spree.root_path
    end

    def flash_messages(opts = {})
      ignore_types = ["order_completed"].concat(Array(opts[:ignore_types]).map(&:to_s) || [])

      flash.each do |msg_type, text|
        unless ignore_types.include?(msg_type)
          concat(content_tag :div, text, class: "flash #{msg_type}")
        end
      end
      nil
    end

    def breadcrumbs(taxon, separator="&nbsp;&raquo;&nbsp;")
      return "" if current_page?("/") || taxon.nil?
      separator = raw(separator)
      crumbs = [content_tag(:li, link_to(Spree.t(:home), spree.root_path) + separator)]
      if taxon
        crumbs << content_tag(:li, link_to(Spree.t(:products), products_path) + separator)
        crumbs << taxon.ancestors.collect { |ancestor| content_tag(:li, link_to(ancestor.name , seo_url(ancestor)) + separator) } unless taxon.ancestors.empty?
        crumbs << content_tag(:li, content_tag(:span, link_to(taxon.name , seo_url(taxon))))
      else
        crumbs << content_tag(:li, content_tag(:span, Spree.t(:products)))
      end
      crumb_list = content_tag(:ul, raw(crumbs.flatten.map{|li| li.mb_chars}.join), class: 'inline')
      content_tag(:nav, crumb_list, id: 'breadcrumbs', class: 'sixteen columns')
    end

    def taxons_tree(root_taxon, current_taxon, max_level = 1)
      return '' if max_level < 1 || root_taxon.children.empty?
      content_tag :ul, class: 'taxons-list' do
        root_taxon.children.map do |taxon|
          css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current' : nil
          link = link_to seo_url(taxon) do
        		content_tag(:i, nil, class: "fa fa-clock-o") + " "+ taxon.name
        	end
          content_tag(:li, class: css_class) do
          	link +
          	taxons_tree(taxon, current_taxon, max_level - 1)
          end
        end.join("\n").html_safe
      end
    end

    def taxons_tree1(root_taxon, current_taxon, max_level = 1)
      return '' if max_level < 1 || root_taxon.children.empty?
      # content_tag :ul, class: 'taxons-list' do
      root_taxon.children.map do |taxon|
        css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current' : nil
        link = link_to seo_url(taxon) do
          content_tag(:i, nil, class: "fa fa-caret-right") + " "+ taxon.name
        end
        content_tag(:li, class: css_class) do
          link +
          taxons_tree(taxon, current_taxon, max_level - 1)
        end
      end.join("\n").html_safe
    end
    
    def available_countries
      checkout_zone = Zone.find_by(name: Spree::Config[:checkout_zone])

      if checkout_zone && checkout_zone.kind == 'country'
        countries = checkout_zone.country_list
      else
        countries = Country.all
      end

      countries.collect do |country|
        country.name = Spree.t(country.iso, scope: 'country_names', default: country.name)
        country
      end.sort_by { |c| c.name.parameterize }
    end

    def seo_url(taxon)
      return spree.nested_taxons_path(taxon.permalink)
    end

    def gem_available?(name)
       Gem::Specification.find_by_name(name)
    rescue Gem::LoadError
       false
    rescue
       Gem.available?(name)
    end

    def display_before_sale_price(product)
      Spree::Money.new(product.before_sale_price || 0, { currency: current_currency }).to_html
    end

    def display_price(product_or_variant)
      return "" if product_or_variant.blank?
      product_or_variant.price_in(current_currency).display_price.to_html
    end

    def pretty_time(time)
      [I18n.l(time.to_date, format: :long),
        time.strftime("%l:%M %p")].join(" ")
    end

    def method_missing(method_name, *args, &block)
      if image_style = image_style_from_method_name(method_name)
        define_image_method(image_style)
        self.send(method_name, *args)
      else
        super
      end
    end

    def link_to_tracking(shipment, options = {})
      return unless shipment.tracking

      if shipment.tracking_url
        link_to(shipment.tracking, shipment.tracking_url, options)
      else
        content_tag(:span, shipment.tracking)
      end
    end


    private

    # Returns style of image or nil
    def image_style_from_method_name(method_name)
      if method_name.to_s.match(/_image$/) && style = method_name.to_s.sub(/_image$/, '')
        possible_styles = Spree::Image.attachment_definitions[:attachment][:styles]
        style if style.in? possible_styles.with_indifferent_access
      end
    end

    def create_product_image_tag(image, product, options, style)
      options.reverse_merge! alt: image.alt.blank? ? product.name : image.alt
      image_tag image.attachment.url(style), options
    end

    def define_image_method(style)
      self.class.send :define_method, "#{style}_image" do |product, *options|
        options = options.first || {}
        if product.try(:cover_image_id).present? && product.cover_image.present?
          create_product_image_tag(product.cover_image, product, options, style)
        elsif product.images.empty?
          if !product.is_a?(Spree::Variant) && !product.variant_images.empty?
            create_product_image_tag(product.variant_images.first, product, options, style)
          else
            if product.is_a?(Variant) && !product.product.variant_images.empty?
              create_product_image_tag(product.product.variant_images.first, product, options, style)
            else
              image_tag "noimage/#{style}.png", options
            end
          end
        else
          create_product_image_tag(product.images.first, product, options, style)
        end
      end
    end
  end

  module Core
    module ControllerHelpers
      module Auth
        def redirect_unauthorized_access
          if try_spree_current_user
            # flash[:error] = Spree.t(:authorization_failure)
            if try_spree_current_user.has_spree_role?("blogger")
              redirect_to admin_blog_entries_url 
            else
              redirect_to '/unauthorized'
            end
          else
            store_location
            if respond_to?(:spree_login_path)
              redirect_to spree_login_path
            else
              redirect_to spree.respond_to?(:root_path) ? spree.root_path : root_path
            end
          end
        end
      end
    end
  end
end
