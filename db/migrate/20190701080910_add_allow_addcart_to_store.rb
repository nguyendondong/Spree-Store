class AddAllowAddcartToStore < ActiveRecord::Migration
  def change
    add_column :spree_stores, :allow_addcart, :boolean
  end
end
