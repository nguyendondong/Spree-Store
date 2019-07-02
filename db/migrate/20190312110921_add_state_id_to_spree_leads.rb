class AddStateIdToSpreeLeads < ActiveRecord::Migration
  def change
    add_column :spree_leads, :state_id, :integer
  end
end
