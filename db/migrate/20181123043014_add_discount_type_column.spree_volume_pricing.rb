# This migration comes from spree_volume_pricing (originally 20121115043422)
class AddDiscountTypeColumn < ActiveRecord::Migration
  def change
    add_column :spree_volume_prices, :discount_type, :string
  end
end
