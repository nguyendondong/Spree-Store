class CreateNoteTemplates < ActiveRecord::Migration
  def change
    create_table :note_templates do |t|
      t.string :name

      t.timestamps
    end
  end
end
