class AddRevenueToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :revenue, :float, :default => 0
  end
end
