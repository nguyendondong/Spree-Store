Spree::Image.class_eval do
	belongs_to :image
	has_attached_file :attachment,
                      styles: { mini: '48x48#', small: '100x100#', thumbnail: '220x220#', product: '340x340#', large: '600x600>' },
                      default_style: :product,
                      url: '/spree/products/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/products/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
                      do_not_validate_attachment_file_type :image
end