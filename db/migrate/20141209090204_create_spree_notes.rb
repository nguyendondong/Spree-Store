class CreateSpreeNotes < ActiveRecord::Migration
  def change
    create_table :spree_notes do |t|
    	t.string :notable_id
    	t.string :notable_type
    	t.string :content
      t.timestamps
    end
  end
end
