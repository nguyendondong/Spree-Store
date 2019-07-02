module Spree
  OrderContents.class_eval do
  	def add(variant, quantity = 1, currency = nil, shipment = nil)
      adjustments = order.adjustments.where(:state => 'closed')
      adjustments.update_all(:state => 'open') if adjustments.present?
      line_item = add_to_line_item(variant, quantity, currency, shipment)
      shipment.add_line_item(line_item) if shipment.present?
      reload_totals
      shipment.present? ? shipment.update_amounts : order.ensure_updated_shipments
      PromotionHandler::Cart.new(order, line_item).activate
      ItemAdjustments.new(line_item).update
      reload_totals
      line_item
    end

    def remove(variant, quantity = 1, shipment = nil)
    	shipment ||= order.shipments.first
      line_item = remove_from_line_item(variant, quantity, shipment)
      shipment.remove_line_item(line_item) if shipment.present?
      reload_totals
      shipment.present? ? shipment.update_amounts : order.ensure_updated_shipments
      PromotionHandler::Cart.new(order, line_item).activate
      ItemAdjustments.new(line_item).update
      reload_totals
      line_item
    end

    private
    def add_to_line_item(variant, quantity, currency=nil, shipment=nil)
      line_item = grab_line_item_by_variant(variant)
      if line_item
        line_item.target_shipment = shipment
        line_item.quantity += quantity.to_i
        line_item.currency = currency unless currency.nil?
        # variant.volume_prices.map(&:range)
        line_item.price =  get_price_with_quantity(variant, line_item.quantity)
      else
        line_item = order.line_items.new(quantity: quantity, variant: variant)
        line_item.target_shipment = shipment
        if currency
          line_item.currency = currency
          line_item.price    = variant.price_in(currency).amount
        else
          line_item.price    = get_price_with_quantity(variant, line_item.quantity)
        end
      end
      line_item.save
      line_item.update_attributes(price: get_price_with_quantity(variant, line_item.quantity) )
      line_item
    end

    def get_price_with_quantity(variant, quantity)

      price_ranges = Spree::Variant.where(product_id: variant.product_id).first.volume_prices[0...-1].map(&:range)
      volume_prices = Spree::Variant.where(product_id: variant.product_id).first.volume_prices[0...-1].map(&:amount)
      price_ranges = price_ranges.map(&:to_range).map{|v| v.map{|i| volume_prices[price_ranges.map(&:to_range).index(v)]}}.flatten
      price = quantity > price_ranges.size ? price_ranges[-1] : price_ranges[quantity-1]

      
      price = variant.price if price.nil?

      price
    end
  end
end