class AddNoticeToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :notice, :string
  end
end
