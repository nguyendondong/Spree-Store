class AddScoreToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :score, :integer, :default => 0
  end
end
