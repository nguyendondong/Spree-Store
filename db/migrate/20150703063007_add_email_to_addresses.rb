class AddEmailToAddresses < ActiveRecord::Migration
  def change
  	add_column :spree_addresses, :email, :string
  end
end
