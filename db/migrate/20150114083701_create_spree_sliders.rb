class CreateSpreeSliders < ActiveRecord::Migration
  def change
    create_table :spree_sliders do |t|
      t.string :name

      t.timestamps
    end
  end
end
