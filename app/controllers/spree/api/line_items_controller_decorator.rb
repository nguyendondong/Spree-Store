module Spree
  module Api
    LineItemsController.class_eval do

      def destroy
        @line_item = find_line_item
        variant = Spree::Variant.find(@line_item.variant_id)
        @order.contents.remove(variant, @line_item.quantity)
        #@order.shipments.delete_all
        @order.payments.delete_all
        @order.create_default_values
        respond_with(@line_item, status: 204)
      end

      def update
        @line_item = find_line_item
        if @order.contents.update_cart(line_items_attributes)
          #@order.shipments.delete_all
          @order.payments.delete_all
          @order.create_default_values
          @line_item.reload
          respond_with(@line_item, default_template: :show)
        else
          invalid_resource!(@line_item)
        end
      end
    end
  end
end
