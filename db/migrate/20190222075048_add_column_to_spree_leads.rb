class AddColumnToSpreeLeads < ActiveRecord::Migration
  def change
    add_column :spree_leads, :fb_url, :string
  end
end
