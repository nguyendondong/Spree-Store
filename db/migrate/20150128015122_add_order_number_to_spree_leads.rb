class AddOrderNumberToSpreeLeads < ActiveRecord::Migration
  def change
    add_column :spree_leads, :order_number, :string, :after => :fb_post_id
  end
end
