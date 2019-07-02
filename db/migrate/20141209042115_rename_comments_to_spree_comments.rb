class RenameCommentsToSpreeComments < ActiveRecord::Migration
  def change
  	rename_table :comments, :spree_comments
  end
end
