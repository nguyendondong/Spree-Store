class AddMajorToSpreeLeads < ActiveRecord::Migration
  def change
    add_column :spree_leads, :major, :string
  end
end
