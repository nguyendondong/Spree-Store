module Spree
    UserRegistrationsController.class_eval do
		before_filter :set_search_ransack

		def set_search_ransack
			@search = Product.search(params[:q])
		end
    end
end
  