class AddAuthorizedApproverIdToOrders < ActiveRecord::Migration
  def change
  	add_column :spree_orders, :authorized_approver_id, :integer
  end
end
