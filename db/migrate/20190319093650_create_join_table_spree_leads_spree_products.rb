class CreateJoinTableSpreeLeadsSpreeProducts < ActiveRecord::Migration
  def change
    create_join_table :leads, :products do |t|
      # t.index [:lead_id, :product_id]
      # t.index [:product_id, :lead_id]
    end
  end
end
