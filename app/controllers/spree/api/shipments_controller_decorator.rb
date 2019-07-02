module Spree
  module Api
  	ShipmentsController.class_eval do
  		before_filter :find_and_update_shipment, only: [:ship, :ready, :add, :remove, :finish]
  		def finish
        unless @shipment.shipped_successfully?
          @shipment.finish!
          @shipment.order.update_attribute("shipment_state", "shipped_successfully")

          # Create notification
          Notification.auto_create( @shipment.order.ref_id, 'Đơn hàng <strong>'+ @shipment.order.number+'</strong> đã ship thành công')

        end
        respond_with(@shipment, default_template: :show)
      end

      def ship
        unless @shipment.shipped?
          @shipment.ship!

          # Create notification
          Notification.auto_create( @shipment.order.ref_id, 'Đơn hàng <strong>'+ @shipment.order.number+'</strong> đang được ship')

        end
        respond_with(@shipment, default_template: :show)
      end

      def ready
        unless @shipment.ready?
          @shipment.ready!
        end
        respond_with(@shipment, default_template: :show)
      end
  	end

  end
end