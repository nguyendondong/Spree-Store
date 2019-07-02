module Spree
  module Admin
    class SlidersController < ResourceController
      def index
        slider = params[:slider] || 1
        @sliders = Slider.page(slider).per(Config[:admin_products_per_page])
      end

      def new
        @slider = Slider.new
      end

      def create
        @slider = Slider.create(slider_params)
        redirect_to spree.admin_sliders_path
      end

      def edit
        get_slider
      end

      def update
        get_slider
        @slider.update_attributes(slider_params)
        redirect_to spree.admin_sliders_path
      end

      private

      def slider_params
        params.require(:slider).permit(:name)
      end

      def get_slider
        @slider = Slider.find(params[:id])
      end
    end
  end
end
