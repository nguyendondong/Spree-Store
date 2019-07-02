module Spree
  Shipment.class_eval do 

    #  shipment state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
    state_machine initial: :pending, use_transactions: false do
      event :ready do
        transition from: :pending, to: :ready, if: lambda { |shipment|
          # Fix for #2040
          shipment.determine_state(shipment.order) == 'ready'
        }
      end

      event :pend do
        transition from: :ready, to: :pending
      end

      event :ship do
        transition from: :ready, to: :shipped
      end
      
      event :finish do
        transition from: :shipped, to: :shipped_successfully
      end
      after_transition to: :shipped, do: :after_ship

    #   event :cancel do
    #     transition to: :canceled, from: [:pending, :ready]
    #   end
    #   after_transition to: :canceled, do: :after_cancel

    #    event :resume do
    #      transition from: :canceled, to: :ready, if: lambda { |shipment|
    #       shipment.determine_state(shipment.order) == :ready
    #     }
    #     transition from: :canceled, to: :pending, if: lambda { |shipment|
    #       shipment.determine_state(shipment.order) == :ready
    #     }
    #     transition from: :canceled, to: :pending
    #  end
    #   after_transition from: :canceled, to: [:pending, :ready], do: :after_resume

    #   after_transition do |shipment, transition|
    #     shipment.state_changes.create!(
    #       previous_state: transition.from,
    #       next_state:     transition.to,
    #       name:           'shipment',
    #     )
    #   end
      end

    def post_office
      @post_office ||= PostOffice.find_by_number(self.po_number)
    end

    def tracking=(val)
      write_attribute(:tracking, val.gsub(/[- ]/, ""))
    end

  	# Determines the appropriate +state+ according to the following logic:
    #
    # pending    unless order is complete and +order.payment_state+ is +paid+
    # shipped    if already shipped (ie. does not change the state)
    # ready      all other cases
    def determine_state(order)
      return 'canceled' if order.canceled?
      return 'pending' unless order.can_ship?
      return 'shipped' if state == 'shipped'
      return 'shipped_successfully' if state == 'shipped_successfully'
      (order.paid? || order.approved?) ? 'ready' : 'pending'
    end

    def send_shipped_email
      # we will not send shipped email
      #ShipmentMailer.shipped_email(self.id).deliver
    end

    def add_line_item(line_item)
      variant = line_item.variant
      quantity = line_item.quantity
      if variant.should_track_inventory?
        on_hand, back_order = stock_location.fill_status(variant, quantity)

        on_hand.times { set_up_inventory('on_hand', variant, order, line_item) }
        back_order.times { set_up_inventory('backordered', variant, order, line_item) }
      else
        quantity.times { set_up_inventory('on_hand', variant, order, line_item) }
      end

      # adding to this shipment, and removing from stock_location
      if order.completed?
        stock_location.unstock(variant, quantity, self)
      end

      quantity
    end

    def remove_line_item(line_item)
      variant = line_item.variant
      quantity = line_item.quantity
      unit = self.inventory_units.find_by_line_item_id(line_item.id)
      unit.destroy if unit.present?

      # adding to this shipment, and removing from stock_location
      if order.completed?
        stock_location.restock(variant, quantity, self)
      end

      quantity
    end

    def refresh_rates
      return shipping_rates if shipped? && shipped_successfully?
      return [] unless can_get_rates?

      # StockEstimator.new assigment below will replace the current shipping_method
      original_shipping_method_id = shipping_method.try(:id)

      self.shipping_rates = Stock::Estimator.new(order).shipping_rates(to_package)

      if shipping_method
        selected_rate = shipping_rates.detect { |rate|
          rate.shipping_method_id == original_shipping_method_id
        }
        self.selected_shipping_rate_id = selected_rate.id if selected_rate
      end

      shipping_rates
    end

    def to_package
      package = Stock::Package.new(stock_location, order)
      grouped_inventory_units = inventory_units.includes(:line_item).group_by do |iu|
        [iu.line_item, iu.state_name]
      end

      grouped_inventory_units.each do |(line_item, state_name), inventory_units|
        package.add line_item, inventory_units.count, state_name if line_item.present?
      end
      package
    end

    def tracking_url
      sm = shipping_method || add_shipping_method(Spree::ShippingMethod.first, true)
      @tracking_url ||= sm.build_tracking_url(tracking)
    end
  end
end