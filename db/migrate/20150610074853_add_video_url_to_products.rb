class AddVideoUrlToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :video_url, :string
  end
end
