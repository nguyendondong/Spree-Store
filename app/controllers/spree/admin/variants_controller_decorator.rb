module Spree
  module Admin
    VariantsController.class_eval do
      before_action :update_params, only: [:update, :create]

      # override the destory method to set deleted_at value
      # instead of actually deleting the product.
      def get_info
        p "-----------------------------------"
        p params
        @image = Variant.find(params[:id]).try(:product).images.first
        respond_to do |format|
          format.html
          format.json { render :json => @image
           }
        end 
      end
      
      def destroy
        @variant = Variant.find(params[:id])
        if @variant.update_attribute :deleted_at, Time.zone.now
          flash[:success] = Spree.t('notice_messages.variant_deleted')
        else
          flash[:success] = Spree.t('notice_messages.variant_not_deleted')
        end

        respond_with(@variant) do |format|
          format.html { redirect_to admin_product_variants_url(params[:product_id]) }
          format.js  { render_js_for_destroy }
        end
      end
      def update_params
        if params[:variant] && params[:variant][:volume_prices_attributes]
          params[:variant][:volume_prices_attributes].each do |v, i|
            s = i[:range_start].to_i
            e = i[:range_end].to_i
            i[:range] =  "(#{s}..#{e})"
            i[:name] = "#{s} - #{e}"
            i[:discount_type] = "price"
          end
        end
      end
    end
  end
end