module Spree
  module Admin
    ReturnAuthorizationsController.class_eval do

      def new
        if @order.shipments.any?
          if @order.return_authorizations.count == 0
            line_item_prices = []
            @return_authorization.order.line_items.group_by(&:variant).each do | variant, items|
              line_item_prices[variant.id] = items.first.price
            end

            return_quantity = {}
            amount = 0
            @return_authorization.order.shipments.collect{|s| s.inventory_units.to_a}.flatten.group_by(&:variant).each do | variant, units|
              return_quantity = return_quantity.merge(variant.id => units.size)
              amount += units.size * line_item_prices[variant.id] if line_item_prices[variant.id].present?
            end

            params.merge!(ActionController::Parameters.new({
                "return_quantity"=>return_quantity,
                "return_authorization"=>{
                  "amount"=>amount.to_f,
                  "reason"=>"",
                  "stock_location_id"=>StockLocation.first.id
                }
            }))

            @return_authorization = @order.return_authorizations.build(authorization_params)
            if @return_authorization.save
              associate_inventory_units
              flash[:success] = Spree.t(:order_awaiting_return)
            else
              flash[:error] = Spree.t(:order_returned_failed)
            end
            redirect_to edit_admin_order_path(@order)
          else
            if @order.state == "returned"
              flash[:success] = Spree.t(:order_returned)
            elsif @order.state == "awaiting_return"
              flash[:success] = Spree.t(:order_awaiting_return)
            end
            redirect_to edit_admin_order_path(@order)
          end
        else
          flash[:error] = Spree.t(:cannot_create_returns)
          redirect_to edit_admin_order_path(@order)
        end
      end

      def authorization_params
        params.require(:return_authorization).permit(:amount, :reason, :stock_location_id)
      end
    end
  end
end
