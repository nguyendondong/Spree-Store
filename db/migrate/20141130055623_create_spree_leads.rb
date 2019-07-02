class CreateSpreeLeads < ActiveRecord::Migration
  def change
    create_table :spree_leads do |t|
      t.references :user
      t.references :product
      t.string :fb_post_id
      t.timestamps
    end
  end
end
