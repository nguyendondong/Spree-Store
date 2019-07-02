class AddRedirectUrlToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :redirect_url, :string
  end
end
