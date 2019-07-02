namespace :product do
	task :update_score => :environment do
		line_items = Spree::LineItem.select("sku, variant_id, price, sum(quantity) as quantity").joins(:variant).joins(:order).where("spree_orders.state = ?", "complete").group(:product_id).order("quantity desc").limit(100)
		line_items.each do |line_item|
			line_item.variant.product.update_attribute(:score, line_item.quantity)
		end
	end

	task :add_responsive_class_to_images => :environment do
		Spree::Product.all.each do |product|
			doc = Nokogiri::HTML::DocumentFragment.parse product.description
			images = doc.css "img"
			images.each do |img| 
				img['style'] = nil
				img['class'] = "img-responsive"
			end
			iframes = doc.css "iframe"
			iframes.each {|iframe| iframe['style'] = "max-width: 100%;"}
			product.description = doc.to_html
			product.save
		end
	end

	task :update_translations => :environment do
		Spree::Product.all.each do |product|
				tran_en = product.translations.find_or_create_by(locale: "en")
				tran_en.update_attributes({
				  name: Vietnameses.convert_unicode(product.name),
				  description: product.description,
				  slug: product.slug,
				  meta_description: product.meta_description,
				  meta_keywords: product.meta_keywords
				})
			
		end
	end
end