class AddPostIdAndParentIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :fb_post_id, :string
  	add_column :comments, :fb_parent_id, :string
  	add_column :comments, :user_id, :string
  end
end
