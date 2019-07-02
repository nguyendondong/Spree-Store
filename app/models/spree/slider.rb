module Spree
  class Slider < ActiveRecord::Base
    has_many :slider_images, :dependent => :destroy
  end
end
