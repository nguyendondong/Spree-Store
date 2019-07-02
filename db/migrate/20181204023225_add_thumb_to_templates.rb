class AddThumbToTemplates < ActiveRecord::Migration

  def up
    add_attachment :templates, :thumb
  end

  def down
    remove_attachment :templates, :thumb
  end
end
