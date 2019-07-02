class AddIndexToNotes < ActiveRecord::Migration
  def change
  	add_index :spree_notes, :notable_id
  end
end
