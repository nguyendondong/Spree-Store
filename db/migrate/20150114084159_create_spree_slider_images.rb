class CreateSpreeSliderImages < ActiveRecord::Migration
  def change
    create_table :spree_slider_images do |t|
      t.string :url
      t.string :alt
      t.attachment :image
      t.references :slider

      t.timestamps
    end
  end
end
