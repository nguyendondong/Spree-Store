class AddAttachmentImageToSpreePhotos < ActiveRecord::Migration
  def self.up
    change_table :spree_photos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :spree_photos, :image
  end
end
