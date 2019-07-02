class RemoveOrderNumberFromSpreeLeads < ActiveRecord::Migration
  def change
    remove_column :spree_leads, :order_number, :string
  end
end
