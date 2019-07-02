module Spree
  class Photo < ActiveRecord::Base
    belongs_to :album

    has_attached_file :image,
                      :styles => lambda {|attachment| attachment.instance.styles},
                      url: '/spree/photos/:id/:style/:basename.:extension',
                      #path: 'spree/photos/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/photos/:id/:style/:basename.:extension',
                      :convert_options => {
                          :thumbnail        => "-strip",
                          #:default_cover=> '-resize 310x -gravity Center -crop 310x210+0+0 +repage',
                          :default_cover => Proc.new { |instance| instance.default_cover_dimension },
                          :large => '-strip -quality 90'
                      }
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    def default_cover_dimension
      dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
      width_scale = 310
      image_ratio = dimensions.width / dimensions.height.to_f
      height_scale = (310 / image_ratio).round(0) + 1
      width_scale = (210 * image_ratio).round(0) + 1 if height_scale < 210
      "-resize #{width_scale}x -gravity Center -crop 310x210+0+0 +repage"
    end

    def styles
       {:large => "1000x1000>", :medium => "280x280>", :default_cover => ""}
    end

    def image_url(style, options={})
      image.url(style, options)
    end
  end
end
