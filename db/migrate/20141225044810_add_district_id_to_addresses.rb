class AddDistrictIdToAddresses < ActiveRecord::Migration
  def change
  	add_column :spree_addresses, :district_id, :integer
  end
end
