class ChangeContentTypeInSpreeNotes < ActiveRecord::Migration
  def up
    change_column :spree_notes, :content, :text, limit: 4294967295
  end
 
  def down
    change_column :spree_notes, :content
  end
end
