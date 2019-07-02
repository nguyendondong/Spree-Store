class ChangePreTaxAmountToSpreeLineItems < ActiveRecord::Migration
  def self.up
    change_column :spree_line_items, :pre_tax_amount, :decimal, :precision => 15, :scale => 2, :default => 0.00
  end
end
