class AddPoNumberToSpreeShipments < ActiveRecord::Migration
  def change
    add_column :spree_shipments, :po_number, :string
  end
end
