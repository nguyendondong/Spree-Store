# A rule to apply to an order greater than (or greater than or equal to)
# a specific amount
module Spree
  class Promotion
    module Rules
      class ItemCount < PromotionRule
        preference :count, :integer, default: 1
        preference :operator, :string, default: '>'

        OPERATORS = ['gt', 'gte']

        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, options = {})
          item_count = order.item_count
          item_count.send(preferred_operator == 'gte' ? :>= : :>, preferred_count.to_i)
        end
      end
    end
  end
end
