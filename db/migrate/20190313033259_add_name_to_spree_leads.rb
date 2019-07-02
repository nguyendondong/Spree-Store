class AddNameToSpreeLeads < ActiveRecord::Migration
  def change
    add_column :spree_leads, :name, :string
  end
end
