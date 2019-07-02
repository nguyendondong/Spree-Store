module Spree
  module Admin
    LineItemsController.class_eval do
    	layout nil, :only => [:create, :destroy, :update, :update_variant]
    	def update_variant
    		load_line_item
    		@line_item.update_attribute(:variant_id, params[:variant_id])
    		render_order_form
    	end
    end
  end
end