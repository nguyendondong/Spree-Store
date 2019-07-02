# This migration comes from spree_multi_domain (originally 20130308084714)
class AddSocialImageToStores < ActiveRecord::Migration
  def self.up
    change_table :spree_stores do |t|
      t.string :social_image_file_name
    end
  end

  def self.down
    change_table :spree_stores do |t|
      t.remove :social_image_file_name
    end
  end
end
