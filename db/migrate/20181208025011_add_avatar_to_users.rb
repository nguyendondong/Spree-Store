class AddAvatarToUsers < ActiveRecord::Migration
  def up
    add_attachment :spree_users, :avatar
  end

  def down
    remove_attachment :spree_users, :avatar
  end
end
