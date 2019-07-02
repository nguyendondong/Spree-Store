class AddRevenueToSpreeUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :revenue, :float, :default => 0
  end
end
