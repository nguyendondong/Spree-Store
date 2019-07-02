class AddPhoneToLeads < ActiveRecord::Migration
  def change
  	add_column :spree_leads, :phone, :string, :after => :order_number
  end
end
