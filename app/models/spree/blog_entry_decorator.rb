module Spree
  BlogEntry.class_eval do
    has_many :blog_entry_taxons, :dependent => :destroy
    has_many :taxons, :through => :blog_entry_taxons
    has_many :products, :through => :taxons
    before_save :add_resposive_class_to_images
    belongs_to :store
    delegate :name, to: :store, allow_nil: true, prefix: true

    def view!
      self.update_attribute(:view, self.view + 1)
    end

	  def add_resposive_class_to_images
	  	doc = Nokogiri::HTML::DocumentFragment.parse body
			images = doc.css "img"
			images.each do |img| 
				img['style'] = nil
				img['class'] = "img-responsive"
			end
			self.body = doc.to_html
	  end

	  def self.most_view(i)
	  	Spree::BlogEntry.reorder('view DESC').take(i)
	  end

	  def self.top_score(i)
	  	Spree::BlogEntry.reorder('score DESC').take(i)
	  end
	  
  end
end