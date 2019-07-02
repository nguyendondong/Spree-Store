class CreateSpreeFbPosts < ActiveRecord::Migration
  def change
    create_table :spree_fb_posts do |t|
    	t.string :fb_id
      t.timestamps
    end
  end
end
