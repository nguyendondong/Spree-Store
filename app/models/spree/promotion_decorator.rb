module Spree
  Promotion.class_eval do
    MATCH_POLICIES = %w(all any)
    UNACTIVATABLE_ORDER_STATES = ["awaiting_return", "returned"]
    def self.order_activatable?(order)
      order && !["awaiting_return", "returned"].include?(order.state)
    end
  end
end