# A rule to apply to an order greater than (or greater than or equal to)
# a specific amount
module Spree
  class Promotion
    module Rules
      class ReturningUser < PromotionRule

        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, options = {})
          if(order.ship_address.present?)
            return Order.complete.joins(:ship_address).where("shipment_state = ? AND spree_addresses.phone = ?", "shipped_successfully", order.ship_address.phone).present?
          end
          false
        end
      end
    end
  end
end