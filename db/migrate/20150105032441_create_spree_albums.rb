class CreateSpreeAlbums < ActiveRecord::Migration
  def change
    create_table :spree_albums do |t|
      t.string :name
      t.string :tag
      t.integer :cover_photo_id
      t.string :product_url
      t.integer :like_count, :default => 0
      t.integer :views, :default => 0
      t.references :user
      t.references :product

      t.timestamps
    end
  end
end
