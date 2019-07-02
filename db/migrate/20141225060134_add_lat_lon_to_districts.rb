class AddLatLonToDistricts < ActiveRecord::Migration
  def change
  	add_column :spree_districts, :latitude, :string
  	add_column :spree_districts, :longtitude, :string
  end
end
