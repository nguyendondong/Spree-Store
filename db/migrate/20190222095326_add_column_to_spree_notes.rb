class AddColumnToSpreeNotes < ActiveRecord::Migration
  def change
    add_column :spree_notes, :lead_id, :integer
  end
end
