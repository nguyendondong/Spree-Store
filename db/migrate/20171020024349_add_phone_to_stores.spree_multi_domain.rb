# This migration comes from spree_multi_domain (originally 20130308084714)
class AddPhoneToStores < ActiveRecord::Migration
  def self.up
    change_table :spree_stores do |t|
      t.string :phone
    end
  end

  def self.down
    change_table :spree_stores do |t|
      t.remove :phone
    end
  end
end
