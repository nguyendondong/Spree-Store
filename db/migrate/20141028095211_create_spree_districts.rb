class CreateSpreeDistricts < ActiveRecord::Migration
  def change
    create_table :spree_districts do |t|
      t.string :name
      t.references :state, index: true

      t.timestamps
    end
  end
end
