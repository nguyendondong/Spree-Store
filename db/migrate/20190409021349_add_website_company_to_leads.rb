class AddWebsiteCompanyToLeads < ActiveRecord::Migration
  def change
    add_column :spree_leads, :website, :string
    add_column :spree_leads, :company, :string
  end
end
