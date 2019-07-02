class AddNoteTemplateIdToNotes < ActiveRecord::Migration
  def change
  	add_column :spree_notes, :note_template_id, :integer
  	add_index :spree_notes, :note_template_id
  end
end
