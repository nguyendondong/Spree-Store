class AddViewToSpreeBlogEntries < ActiveRecord::Migration
  def change
    add_column :spree_blog_entries, :view, :integer, :default => 0
  end
end
