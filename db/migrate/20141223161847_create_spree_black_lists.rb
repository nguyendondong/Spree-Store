class CreateSpreeBlackLists < ActiveRecord::Migration
  def change
    create_table :spree_black_lists do |t|
    	t.string :ip
      t.timestamps
    end
  end
end
