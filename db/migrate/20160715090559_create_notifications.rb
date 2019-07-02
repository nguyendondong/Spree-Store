class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :message
      t.references :user, index: true
      t.boolean :active, default: 1

      t.timestamps
    end
  end
end
