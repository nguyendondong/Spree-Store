class AddUserIdToNotes < ActiveRecord::Migration
  def change
  	add_column :spree_notes, :user_id, :integer
  end
end
