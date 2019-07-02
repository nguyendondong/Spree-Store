class AddDistrictIdAndStateIdToSpreePostOffices < ActiveRecord::Migration
  def change
    add_column :spree_post_offices, :district_id, :integer, :after => :province
    add_column :spree_post_offices, :state_id, :integer, :after => :district_id
  end
end
