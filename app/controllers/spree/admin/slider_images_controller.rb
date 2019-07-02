module Spree
  module Admin
    class SliderImagesController < ResourceController
      before_filter :get_slider, :except => [:destroy, :update]

      def index
        slider_image = params[:slider_image] || 1
        @slider_images = @slider.slider_images.page(slider_image).per(Config[:admin_products_per_page])
      end

      def new
        @slider_image = SliderImage.new
      end

      def create
        @slider_image = @slider.slider_images.create(slider_image_params)
        redirect_to spree.admin_slider_slider_images_path(@slider)
      end

      def edit
        get_slider_image
      end

      def update
        get_slider
        @slider_image.update_attributes(slider_image_params)
        redirect_to spree.admin_slider_slider_images_path(@slider.id)
      end

      private

      def slider_image_params
        params.require(:slider_image).permit(:image, :slider_id, :url, :alt)
      end

      def get_slider_image
        @slider_image = SliderImage.find(params[:id])
      end

      def get_slider
        @slider = Slider.find(params[:slider_id])
      end
    end
  end
end
