namespace :blog do
	task :add_responsive_class_to_images => :environment do
		Spree::BlogEntry.all.each do |blog|
			doc = Nokogiri::HTML::DocumentFragment.parse blog.body
			images = doc.css "img"
			images.each do |img| 
				img['style'] = nil
				img['class'] = "img-responsive"
			end
			blog.body = doc.to_html
			blog.save
		end
	end

end