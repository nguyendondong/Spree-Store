module Spree
  Admin::ZonesController.class_eval do

    protected

      def collection
        params[:q] ||= {}
        params[:q][:s] ||= "ascend_by_name"
        @search = super.ransack(params[:q])
        @zones = @search.result.page(params[:page]).per(params[:per_page])
      end

      def load_data
        @countries = Country.order(:name)
        @states = State.order(:name)
        @districts = District.order(:name)
        @zones = Zone.order(:name)
      end
  end
end
