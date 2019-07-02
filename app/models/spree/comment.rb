class Spree::Comment < ActiveRecord::Base
  belongs_to :product, class_name: 'Spree::Product'
  belongs_to :user, class_name: 'Spree::User'

  def post_url
  	# fb_url_id is the id that facebook assign to the product's url
  	# fb_post_id is the id that is attached to a page on facebook that this product was shared
  	url = ""
  	if(href.present?)
  		comment_id = fb_parent_id.present? ? fb_parent_id : commentID
  		if product.present? && product.fb_url_id.present?
  			url = href + "?fb_comment_id=fbc_#{product.fb_url_id}_#{comment_id}_#{comment_id}"
  		else
  			url = href
  		end
  	else
	  	if fb_post_id.present?
		  	post_id = fb_post_id.split("_").last
		  	comment_id = commentID.split("_").last
		  	if(fb_parent_id.present?)
		  		comment_id = fb_parent_id.split("_").last
			  	url = "https://facebook.com/permalink.php?story_fbid=#{post_id}&id=249467635263830&comment_id=#{comment_id}"  		
		  	else
			  	url = "https://facebook.com/permalink.php?story_fbid=#{post_id}&id=249467635263830&comment_id=#{comment_id}"
		  	end
		  end
		end
	  return url
  end
end