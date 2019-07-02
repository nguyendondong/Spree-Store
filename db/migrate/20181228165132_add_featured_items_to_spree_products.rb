class AddFeaturedItemsToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :featured_item, :boolean, default: false, null: false
  end
end
