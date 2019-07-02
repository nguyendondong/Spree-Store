class RemoveProductIdFromSpreeLeads < ActiveRecord::Migration
  def change
    remove_column :spree_leads, :product_id, :string
  end
end
