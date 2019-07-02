class CreateSpreePhotos < ActiveRecord::Migration
  def change
    create_table :spree_photos do |t|
      t.references :album

      t.timestamps
    end
  end
end
