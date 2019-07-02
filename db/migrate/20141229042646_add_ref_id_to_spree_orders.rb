class AddRefIdToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :ref_id, :integer
  end
end
