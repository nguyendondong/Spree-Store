class AddFieldsToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :active, :boolean, null: false, default: 1
    add_column :campaigns, :description, :text
  end
end
