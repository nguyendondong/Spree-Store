class AddLatLonToAddress < ActiveRecord::Migration
  def change
  	add_column :spree_addresses, :latitude, :string
  	add_column :spree_addresses, :longtitude, :string
  end
end
