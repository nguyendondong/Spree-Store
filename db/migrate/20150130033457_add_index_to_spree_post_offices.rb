class AddIndexToSpreePostOffices < ActiveRecord::Migration
  def change
    add_index :spree_post_offices, :number
  end
end
