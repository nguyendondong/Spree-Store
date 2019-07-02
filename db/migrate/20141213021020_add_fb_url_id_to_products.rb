class AddFbUrlIdToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :fb_url_id, :string
  end
end
