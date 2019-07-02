Spree::Product.class_eval do
	# Attributes:
	# 	1. redirect_url: string, if this field is present, system will redirect to redirect_url when user visit products#show page
  has_many :albums
  belongs_to :cover_image, :class_name => "Spree::Image", :foreign_key => :cover_image_id
  before_save :add_resposive_class_to_images
  has_and_belongs_to_many :leads, join_table: 'leads_products'
  has_many :images
  has_many :products_stores, class_name: "Spree::ProductsStore"

  # after_save :update_translations

  def add_resposive_class_to_images
  	doc = Nokogiri::HTML::DocumentFragment.parse description
		images = doc.css "img"
		images.each do |img|
			img['style'] = nil
			img['class'] = "img-responsive"
		end
		iframes = doc.css "iframe"
		iframes.each {|iframe| iframe['style'] = "max-width: 100%;"}
		self.description = doc.to_html
  end

  def has_preorder?(store)
    products_stores.where(store_id: store.id).first.try(:allow_addcart)
  end
  # def update_translations
  #   tran_en = self.translations.find_or_create_by(locale: "en")
  #   tran_en.update_attributes({
  #     name: self.name,
  #     description: self.description,
  #     slug: self.slug,
  #     meta_description: self.meta_description,
  #     meta_keywords: self.meta_keywords
  #   })
  # end
  # thump_nail could be :product, :original
  def rep_image_url(thump_nail)
  	if cover_image.present? && cover_image.attachment.url(thump_nail).present?
  		cover_image.attachment.url(thump_nail)
  	else
  		images.first.attachment.url(thump_nail)
  	end
  end

  def self.top_score(i)
    Spree::Product.order('score DESC').take(i);
  end

  # Count number of shipped products
  def shipped_count
    #line_items.joins(:order).where("spree_orders.shipment_state in (?)", ["shipped_successfully", "shipped"]).count
    Spree::LineItem.joins(:order).where("spree_orders.state in (?)", ["complete", "awaiting_return"]).where("spree_orders.shipment_state in (?)", ["shipped_successfully", "shipped"]).where(:variant_id => variants_including_master).sum(:quantity)
  end

  def all_prices
    price_ranges = Spree::Variant.where(product_id: self.id).first.volume_prices[0...-1].map(&:range)
    volume_prices = Spree::Variant.where(product_id: self.id).first.volume_prices[0...-1].map(&:amount).map(&:to_f)
    price_ranges.map(&:to_range).map{|v| v.map{|i| volume_prices[price_ranges.map(&:to_range).index(v)]}}.flatten
  end
  
  def price_based_on_volume_product
    Spree::Variant.where(product_id: self.id).first.volume_prices[0..-1].map{|v| {name: v.name, amount:  v.amount.to_f}  }
  end

  def price_based_on_volume_product_objs
    Spree::Variant.where(product_id: self.id).first.volume_prices[0..-1]
  end

  def lowest_discounted_volume_price
    Spree::Variant.where(product_id: self.id).first.volume_prices[-1].try(:amount).try(:to_f)
  end

  def lowest_discounted_volume_price_obj
    Spree::Variant.where(product_id: self.id).first.volume_prices[-1]
  end

end
