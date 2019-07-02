class AddStoreIdToBlogEntries < ActiveRecord::Migration
  def change
  	add_column :spree_blog_entries, :store_id, :integer
  	add_index :spree_blog_entries, :store_id
  end
end
