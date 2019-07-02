class AddAllowAddcartToSpreeProductsStores < ActiveRecord::Migration
  def change
    add_column :spree_products_stores, :allow_addcart, :boolean
  end
end
