class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :spree_users, :fb_id, :string
  	add_column :spree_users, :fb_name, :string
  	add_column :spree_users, :phone, :string
  end
end
