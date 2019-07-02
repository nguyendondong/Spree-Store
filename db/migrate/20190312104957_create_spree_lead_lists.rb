class CreateSpreeLeadLists < ActiveRecord::Migration
  def change
    create_table :spree_lead_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
