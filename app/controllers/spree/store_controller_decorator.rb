module Spree
  StoreController.class_eval do
		before_filter :load_comments
		before_filter :set_search_ransack

		def set_search_ransack
			@search = Product.search(params[:q])
		end
		

		
		def load_comments
			@staff = spree_current_user.present? && (spree_current_user.has_spree_role?('sales_rep') || spree_current_user.has_spree_role?('admin'))
			if @staff
				@comments = Comment.includes(:product).where(read: false).order("created_at desc")
			end
		end

		def update
			p permitted_store_params
			@store.assign_attributes(permitted_store_params)

			if @store.save
				flash[:success] = flash_message_for(@store, :successfully_updated)
				redirect_to admin_stores_path
			else
				flash[:error] = "#{Spree.t('store.errors.unable_to_update')}: #{@store.errors.full_messages.join(', ')}"
				render :edit
			end
		end

		def permitted_store_params
			params.require(:store).permit([:name, :url, :seo_title, :code, :meta_keywords, :meta_description, :default_currency, :mail_from_address, :template,:allow_addcart])
		end
  end
end