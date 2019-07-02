module Spree
  class PostOffice < ActiveRecord::Base
    belongs_to :state
    belongs_to :district
  end
end
