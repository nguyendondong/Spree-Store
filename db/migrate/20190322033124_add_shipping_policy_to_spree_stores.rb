class AddShippingPolicyToSpreeStores < ActiveRecord::Migration
  def change
    add_column :spree_stores, :shipping_policy, :text
  end
end
