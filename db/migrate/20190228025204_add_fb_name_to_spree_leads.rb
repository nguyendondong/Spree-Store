class AddFbNameToSpreeLeads < ActiveRecord::Migration
  def change
    add_column :spree_leads, :fb_name, :string
  end
end
