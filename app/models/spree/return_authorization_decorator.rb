module Spree
  ReturnAuthorization.class_eval do
  	def returnable_inventory
      order.shipments.collect{|s| s.inventory_units.to_a}.flatten
    end
  end
end