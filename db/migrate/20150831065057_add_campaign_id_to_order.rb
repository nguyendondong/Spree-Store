class AddCampaignIdToOrder < ActiveRecord::Migration
  def change
  	add_column :spree_orders, :campaign_id, :integer
  end
end
