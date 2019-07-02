namespace :user do
	task :update_phone_from_comment => :environment do
		Spree::Comment.all.each do |comment|
			if(comment.message.phone_number.present? && comment.user.present?)
				comment.user.update_attribute(:phone, comment.message.phone_number) unless comment.user.phone.present?
				if comment.product.present?
					Spree::Lead.find_or_create_by(user_id: comment.user.id, product_id: comment.product.id) 
				elsif comment.fb_post_id.present?
					Spree::Lead.find_or_create_by(user_id: comment.user.id, fb_post_id: comment.fb_post_id) 
				end
				
			end
		end
	end
end