class AddDistrictToAddress < ActiveRecord::Migration
  def change
    add_column :spree_addresses, :district, :string
  end
end
