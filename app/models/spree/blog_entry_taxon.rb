module Spree
  class BlogEntryTaxon < ActiveRecord::Base
    belongs_to :taxon
    belongs_to :blog_entry
  end
end

