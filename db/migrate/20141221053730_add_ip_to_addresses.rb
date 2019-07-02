class AddIpToAddresses < ActiveRecord::Migration
  def change
  	add_column :spree_addresses, :ip, :string
  end
end
