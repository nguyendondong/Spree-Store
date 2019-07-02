class AddNoteToOrders < ActiveRecord::Migration
  def change
  	add_column :spree_orders, :note, :string
  end
end
