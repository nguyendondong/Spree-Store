module Spree
  class SliderImage < ActiveRecord::Base
    belongs_to :slider

    has_attached_file :image,
                      styles: { product: '960x300>', mini: '105x51>' },
                      default_style: :slider,
                      url: '/spree/slider_images/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/slider_images/:id/:style/:basename.:extension', # for local

                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
    validates_attachment :image,
                         :presence => true,
                         :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }
  end
end
