class CreateSpreePostOffices < ActiveRecord::Migration
  def change
    create_table :spree_post_offices do |t|
      t.string :number
      t.string :name
      t.string :address
      t.string :province

      t.timestamps
    end
  end
end
