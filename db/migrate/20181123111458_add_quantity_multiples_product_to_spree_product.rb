class AddQuantityMultiplesProductToSpreeProduct < ActiveRecord::Migration
  def change
    add_column :spree_products, :quantity_multiples_product, :decimal, default: 1
  end
end
