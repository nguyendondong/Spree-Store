class AddColumnToSpreeStockTransfers < ActiveRecord::Migration
  def change
    add_column :spree_stock_transfers, :user_id, :integer
  end
end
