module Spree
  ProductsController.class_eval do
    
    def index
     
      @products = current_store.products.order("spree_products.score desc, spree_products.created_at desc").page(params[:page]).per(12)
      @search = Product.ransack(params[:q])
      @products = @search.result(distinct: true).includes(:variants) if params[:q].present? && params[:q][:name_cont].present?

      respond_to do |format|
        format.html
        format.js
        format.json { render :json => @products }
      end
    end
    
    def search
      per_page = params[:per_page] || 12
      @products = current_store.products.order("spree_products.score desc, spree_products.created_at desc").page(params[:page]).per(12)
      @search = current_store.products.with_translations.ransack(params[:q])
      @products = @search.result(distinct: true).includes(:variants).page(params[:page]).per(per_page)
      p "------------------"
      p params[:q].present? && params[:q][:name_cont].present?
      p @products.count
      p @products.map(&:name)
     

      respond_to do |format|
        format.html
        format.js
        format.json { render :json => @products }
      end
    end
    

    def search_show
       per_page = params[:per_page] || 12
      @products = current_store.products.order("spree_products.score desc, spree_products.created_at desc").page(params[:page]).per(12)
      @search = current_store.products.ransack(params[:q])
      @products = @search.result.all
      respond_to do |format|
        format.html
        format.js
        format.json { render :json => @products }
      end
    end
    

    def show

      redirect_to @product.redirect_url and return if @product.redirect_url.present?
      if cookies[:products_id].nil?
        cookies[:products_id]=[]
        cookies[:products_id] << @product.id.to_s
        cookies[:products_name]= []
        cookies[:products_name] <<  @product.name
      else
        if cookies[:products_id].split(',').exclude? @product.id.to_s
        cookies[:products_id] +=  ',' + @product.id.to_s
        cookies[:products_name] += ',' + @product.name
        end
      end


      @variants = @product.variants_including_master.active(current_currency).includes([:option_values, :images])
      @product_properties = @product.product_properties.includes(:property)
      @taxon = Spree::Taxon.find(params[:taxon_id]) if params[:taxon_id]
      @taxons = @product.taxons
      @taxon ||= @taxons.first
      @taxonomies = current_store.taxonomies.includes(root: :children)
      @static_star = { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0 }
      @static_star =  @static_star.merge(@product.reviews.group(:rating).count)
      tmp = []
      @total = @product.reviews.count
      if @total == 0
        @static_star == 0
      else
        @static_star.each do |k,v|
          tmp[k] = {quanity: v, pecent_on_total: ((v.to_f / @total)*100).round  }
        end
        p tmp
        @static_star = tmp
      end
      if @taxon.present?
	      @searcher = build_searcher({taxon: @taxon.id, include_images: true})
	      @related_products = @searcher.retrieve_products.where("spree_products.id <> ?", @product.id).limit(4)
      end
      
    end

  end

  def show_cookies
    @product_id = cookies[:product_id]
    @product_name =cookies[:product_name]
  end

end
