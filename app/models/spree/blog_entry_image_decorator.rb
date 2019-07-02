Spree::BlogEntryImage.class_eval do
	has_attached_file :attachment, 
     :styles => {:mini => '48x48#', :normal => '100x100#', :large => '600x600#'},
     :default_style => :large,
     :url => "/assets/blog_entry_images/:id/:style/:basename.:extension",
     :path => ":rails_root/public/assets/blog_entry_images/:id/:style/:basename.:extension"  
end