module Spree
  OrderUpdater.class_eval do 
    # Updates the +shipment_state+ attribute according to the following logic:
    #
    # shipped   when all Shipments are in the "shipped" state
    # partial   when at least one Shipment has a state of "shipped" and there is another Shipment with a state other than "shipped"
    #           or there are InventoryUnits associated with the order that have a state of "sold" but are not associated with a Shipment.
    # ready     when all Shipments are in the "ready" state
    # backorder when there is backordered inventory associated with an order
    # pending   when all Shipments are in the "pending" state
    #
    # The +shipment_state+ value helps with reporting, etc. since it provides a quick and easy way to locate Orders needing attention.
    def update_shipment_state

      # will return nil if no shipments are found
      order.shipment_state = shipments.states.first

      order.state_changed('shipment')
      order.shipment_state
    end

     # Updates the +payment_state+ attribute according to the following logic:
    #
    # paid          when +payment_total+ is equal to +total+
    # balance_due   when +payment_total+ is less than +total+
    # credit_owed   when +payment_total+ is greater than +total+
    # failed        when most recent payment is in the failed state
    #
    # The +payment_state+ value helps with reporting, etc. since it provides a quick and easy way to locate Orders needing attention.
    def update_payment_state
      last_state = order.payment_state
      if payments.present? && payments.valid.size == 0
        order.payment_state = 'failed'
      elsif !payments.present? && order.state == 'canceled'
        order.payment_state = 'void'
      elsif order.state == 'canceled' && order.payment_total == 0 && payments.completed.size > 0
        order.payment_state = 'void'
      else
        order.payment_state = 'balance_due' if order.outstanding_balance > 0
        # remove credit owned state
        order.payment_state = 'paid' if order.outstanding_balance < 0
        order.payment_state = 'paid' if !order.outstanding_balance?
      end
      order.state_changed('payment') if last_state != order.payment_state
      order.payment_state
    end

    def recalculate_adjustments
      all_adjustments.includes(:adjustable).map(&:adjustable).uniq.each { |adjustable| Spree::ItemAdjustments.new(adjustable).update if(adjustable.present?)} if all_adjustments.present?
    end
  end
end