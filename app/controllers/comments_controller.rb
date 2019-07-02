class CommentsController < ApplicationController
	def create
		@product = Spree::Product.find_by_slug(params[:product_slug])
		read = staff?
		respond_to do |format|
			if @product.present?
				fb_comment = FbGraph::Comment.fetch(params["commentID"])
				fb_user_id = fb_comment.from.identifier
				new_user = Spree::User.find_or_create_by(email: "#{fb_user_id}@facebook.com") do |user|
					user.password = "password"
					user.fb_name = fb_comment.from.raw_attributes["name"]
					user.fb_id = fb_user_id
					
				end
				Spree::Comment.create(comment_parameters.merge({user_id: new_user.id, product_id: @product.id, read: read, fb_parent_id: params["parentCommentID"]}))
				new_user.update_attribute("phone", fb_comment.message.phone_number) if fb_comment.message.phone_number.present?
				if(staff?)
					if(params["parentCommentID"].present?)
						 parent_comment = Spree::Comment.find_by_commentID(params["parentCommentID"])
						 parent_comment.update_attribute("read", true)
					end
				end
				format.json {render :json => {result: 'ok'}}
			else
				format.json {render :json => {result: 'failed'}}
			end
    end
	end

	protected
	def comment_parameters
    params.permit(:commentID, :message, :href, :product_id)
  end

  private
	  def staff?
	  	spree_current_user.present? && (spree_current_user.has_spree_role?('sales_rep') || spree_current_user.has_spree_role?('admin'))
	  end
end