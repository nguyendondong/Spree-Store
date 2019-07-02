class AddColumnSourceToOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :source, :string
  end
end
