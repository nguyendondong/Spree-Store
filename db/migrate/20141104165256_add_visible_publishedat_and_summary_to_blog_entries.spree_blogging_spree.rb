# This migration comes from spree_blogging_spree (originally 20130216181713)
class AddVisiblePublishedatAndSummaryToBlogEntries < ActiveRecord::Migration
  def change
    add_column :spree_blog_entries, :visible, :boolean, :default => false
    add_column :spree_blog_entries, :published_at, :datetime
    add_column :spree_blog_entries, :summary, :text
  end
end
