class AddDistrictIdToSpreeLeads < ActiveRecord::Migration
  def change
    add_column :spree_leads, :district_id, :integer
  end
end
