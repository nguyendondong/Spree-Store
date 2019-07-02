class AddSomeFieldToReports < ActiveRecord::Migration
  def change
    add_column :reports, :order_counts, :integer
    add_column :reports, :order_returns, :integer
    add_column :reports, :item_total, :decimal
    add_column :reports, :promo_total, :decimal
    add_column :reports, :item_return, :decimal
    add_column :reports, :net_total, :decimal
    add_column :reports, :shipment_total, :decimal
    add_column :reports, :tax_total, :decimal
    add_column :reports, :total, :decimal
  end
end
