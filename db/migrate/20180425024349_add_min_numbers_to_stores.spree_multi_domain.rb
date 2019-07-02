# This migration comes from spree_multi_domain (originally 20130308084714)
class AddMinNumbersToStores < ActiveRecord::Migration
  def change
    change_table :spree_stores do |t|
      t.integer :min_order_value, default: 0
      t.integer :min_order_unit_number, default: 0
    end
  end
end
