class RenameDistrictInAddress < ActiveRecord::Migration
  def change
  	rename_column :spree_addresses, :district, :district_name
  end
end
