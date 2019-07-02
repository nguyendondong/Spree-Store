module Spree
  module Admin
    ImagesController.class_eval do

      def create
        params['image']['attachment'].each do |image_attachment|
          params['image']['attachment'] = image_attachment
          params['image']['viewable_type'] = 'Spree::Variant'
          @image = scope.images.create(image_params)
        end

        @product.variant_images.each do |image|
          @options_text_for = @options_text_for.to_a.push options_text_for(image)
        end

        respond_to do |format|
          format.json do
            render :json => {
              :product => @product.to_json(
                :include => [:variant_images]),
              :has_variants => @product.has_variants?,
              :options_text_for => @options_text_for }
          end
          format.html { redirect_to admin_product_images_path }
        end
      end

      def update
        # params['image']['viewable_type'] = 'Spree::Variant'
        # @image = scope.images.accessible_by(current_ability, :update).find(params[:id])
        # @image.update_attributes(image_params)
        # respond_to do |format|
        #   format.json { render json: @image.to_json }
        #   format.html { redirect_to admin_product_images_path }
        # end
        invoke_callbacks(:update, :before)
        if @object.update_attributes(permitted_resource_params)
          invoke_callbacks(:update, :after)
          respond_with(@object) do |format|
            format.html do
              flash[:success] = flash_message_for(@object, :successfully_updated)
              redirect_to location_after_save
            end
            format.js { render layout: false }
          end
        else
          invoke_callbacks(:update, :fails)
          respond_with(@object) do |format|
            format.html { render action: :edit }
            format.js { render layout: false }
          end
        end

      end

      private
        def image_params
          params.require(:image).permit(permitted_image_attributes)
        end
        def scope
          if params[:product_id]
            scope = Spree::Product.friendly.find(params[:product_id])
          elsif params[:variant_id]
            scope = Spree::Variant.find(params[:variant_id])
          end
        end
        def options_text_for(image)
          if image.viewable.is_a?(Spree::Variant)
            if image.viewable.is_master?
              Spree.t(:all)
            else
              image.viewable.sku_and_options_text
            end
          else
            Spree.t(:all)
          end
        end

    end
  end
end