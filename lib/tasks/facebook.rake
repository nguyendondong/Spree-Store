namespace :facebook do

	task :fetch_comments => :environment do
		fb_config = Rails.application.config.facebook
		page = FbGraph::Page.new(fb_config[:fb_page_id], :access_token => fb_config[:fb_token])
		posts = page.posts
		while(posts.present?) do
			posts.each do |post|
				url = URI.extract(post.message).select{|url| url.include?("http://donghox.com")}.first if post.message.present? && URI.extract(post.message).present?
				slug = url[url.index("/products/") + 10..url.length-1] if url.present? && url.index("/products/").present?
				product = Spree::Product.find_by_slug(slug) if slug.present?
				product.update_attribute(:fb_post_id, post.identifier) if product.present?
				comment_count = Spree::Comment.where("fb_post_id = ?", post.identifier).count
				comments = post.comments({:filter => "stream", :limit => 100, :offset => comment_count,
					 :fields=>["id", "parent", "message", "from", "created_time"]})
				while(comments.present?) do
					comments.each do |fb_comment|

					  fb_user_id = fb_comment.from.identifier
						new_user = Spree::User.find_or_create_by(email: "#{fb_user_id}@facebook.com") do |user|
							user.password = "password"
							user.fb_name = fb_comment.from.raw_attributes["name"]
							user.fb_id = fb_user_id
						end
						new_user.update_attribute("phone", fb_comment.message.phone_number) if fb_comment.message.phone_number.present?
						# create comment in db if not exist
						Spree::Comment.find_or_create_by(commentID: fb_comment.identifier) do |c|
							c.product_id = product.id if product.present?
							c.message = fb_comment.message
							c.fb_parent_id = fb_comment.raw_attributes["parent"]["id"] if fb_comment.raw_attributes["parent"].present? 
							if fb_comment.from.raw_attributes["name"] == "Dong ho X-Teen"
								c.read = true
								if fb_comment.raw_attributes["parent"].present? 
									Spree::Comment.where("commentID = ? OR fb_parent_id = ?", c.fb_parent_id, c.fb_parent_id).update_all(read: true)
								end
							end
							c.created_at = fb_comment.created_time
							c.fb_post_id = post.identifier
							c.user_id = new_user.id
						end

						# user provided phone number, create a new lead
						if(fb_comment.message.phone_number.present? && fb_comment.from.raw_attributes["name"] != "Dong ho X-Teen")
							Spree::Lead.find_or_create_by(user_id: new_user.id, fb_post_id: post.identifier, phone: fb_comment.message.phone_number) do |lead|
								lead.product_id = product.id if product.present?
							end
						end
					end
					comments = comments.next
				end
			end
			posts = posts.next
		end
	end
end