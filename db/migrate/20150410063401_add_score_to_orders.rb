class AddScoreToOrders < ActiveRecord::Migration
  def change
  	add_column :spree_orders, :score, :integer, :default => 0
  end
end
