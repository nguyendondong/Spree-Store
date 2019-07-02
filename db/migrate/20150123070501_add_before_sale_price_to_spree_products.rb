class AddBeforeSalePriceToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :before_sale_price, :float
  end
end
