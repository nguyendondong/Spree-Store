class AddDeviceToOrders < ActiveRecord::Migration
  def change
  	add_column :spree_orders, :device, :string
  end
end
