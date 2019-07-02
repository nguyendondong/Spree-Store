# This migration comes from spree_volume_pricing (originally 20110203174010)
class ChangeDisplayNameForVolumePrices < ActiveRecord::Migration
  def self.up
    rename_column :volume_prices, :display, :name
  end

  def self.down
    rename_column :volume_prices, :name, :display
  end
end
