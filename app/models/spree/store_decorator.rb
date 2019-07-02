module Spree
  Store.class_eval do
  	#if respond_to? :logo_content_type
  	#	validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
    #end
    #has_and_belongs_to_many :taxons, join_table: 'spree_taxons_stores'
    has_many :taxons, through: :taxonomies
    has_one :tracker
    has_many :blog_entries
    has_one :templatestore

    has_many :products_stores, class_name: "Spree::ProductsStore"
    # belongs_to :template, class_name: 'StoreTemplate', foreign_key: 'template'
    # delegate :name, to: :template, prefix: true, allow_nil: true
    after_update :update_spree_products_stores
    do_not_validate_attachment_file_type :logo
    has_attached_file :logo,
      styles: { mini: '48x48>', small: '248x80>', medium: '250x250>' },
      default_style: :medium,
      url: '/stores/:id/:style/:basename.:extension',
      path: ':rails_root/public/stores/:id/:style/:basename.:extension',
      convert_options: { all: '-strip -auto-orient' }

    do_not_validate_attachment_file_type :social_image
    has_attached_file :social_image,
      styles: { small: '240x126>', medium: '1200x630>' },
      default_style: :medium,
      url: '/stores/:id/:style/:basename.:extension',
      path: ':rails_root/public/stores/:id/:style/:basename.:extension',
      convert_options: { all: '-strip -auto-orient' }

    def self.templates
      @@templates ||= Dir.entries('app/views_template').select {|entry| File.directory? File.join('app/views_template',entry) and !(entry =='.' || entry == '..') }
    end
    def update_spree_products_stores
      products_stores.update_all(allow_addcart: self.allow_addcart)
    end
  end
end
