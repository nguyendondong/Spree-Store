class AddReferIdToSpreeUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :ref_id, :integer
  end
end
