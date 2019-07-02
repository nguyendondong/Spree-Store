class AddZaloToSpreeLeads < ActiveRecord::Migration
  def change
    add_column :spree_leads, :zalo, :string
  end
end
