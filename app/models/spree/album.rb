module Spree
  class Album < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

    has_many :photos, :dependent => :destroy
    belongs_to :cover_photo, :class_name => "Photo", :foreign_key => :cover_photo_id

    before_save :create_tag
    before_save :set_product

    def to_param
      tag
    end

    def add_photos(files)
      files.each do |file|
        photo = self.photos.create(:image => file)
        self.update_attribute(:cover_photo_id, photo.id) if self.cover_photo.blank? && photo.present?
      end
    end

    private

    def create_tag
      self.name = "Album" if self.name.blank?
      raw_tag = self.name
      base_tag = raw_tag.to_ascii.parameterize
      tag = raw_tag.to_ascii.parameterize

      # append sequence number to ensure that it is unique
      sequence = 1
      while (album = Album.find_by_tag(tag))
        break if album.id == self.id

        sequence += 1
        tag = "#{base_tag}-#{sequence}"
      end

      self.tag = tag
    end

    def set_product
      return if product_url.blank?
      slug = product_url.split("/").last
      slug = product_url.split("/").last(2).first if slug.blank?
      if slug.present?
        product = Spree::Product.find_by_slug(slug)
        if product.present?
          self.product_id = product.id
        else
          self.product_id = nil
        end
      end
    end
  end
end
