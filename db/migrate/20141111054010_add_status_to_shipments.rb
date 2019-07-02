class AddStatusToShipments < ActiveRecord::Migration
  def change
  	add_column :spree_shipments, :status, :string
  end
end
