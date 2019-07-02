class AddRealCostToShipments < ActiveRecord::Migration
  def change
  	add_column :spree_shipments, :real_cost, :integer
  end
end
