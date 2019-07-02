class AddImgToSpreeProducts < ActiveRecord::Migration
  def up
    add_attachment :spree_products, :image
  end

  def down
    remove_attachment :spree_products, :image
  end
end
