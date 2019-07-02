class AddFbPostIdToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :fb_post_id, :string
  end
end
