class AddLeadIdToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :lead_id, :integer
  end
end
