class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :product, index: true
      t.string :href
      t.string :commentID #id of this comment in facebook
      t.text :message
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
