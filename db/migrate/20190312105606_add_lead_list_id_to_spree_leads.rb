class AddLeadListIdToSpreeLeads < ActiveRecord::Migration
  def change
    add_column :spree_leads, :lead_list_id, :integer
  end
end
