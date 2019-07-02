module Spree
	Taxon.class_eval do
		has_and_belongs_to_many :stores, join_table: 'spree_taxons_stores'
    scope :by_store, -> (store) { joins(:stores).where(spree_taxons_stores: { store_id: store }) }
    has_attached_file :thumb,
    	styles: { large: "1200x630"  },
        default_style: :large,
        url: '/spree/taxons/:id/thumb/:style/:basename.:extension',
        path: ':rails_root/public/spree/taxons/:id/thumb/:style/:basename.:extension',
        default_url: '/assets/default_taxon.png'
    has_attached_file :icon,
        styles: { mini: '32x32>', normal: '128x128>', med: '512x512' },
        default_style: :med,
        url: '/spree/taxons/:id/:style/:basename.:extension',
        path: ':rails_root/public/spree/taxons/:id/:style/:basename.:extension',
        default_url: '/assets/default_taxon.png'
    after_save :touch_stores
    # Return meta_title if set otherwise generates from root name and/or taxon name
    def seo_title
      meta_title || name
    end

		def touch_stores
			# TODO: only update stores of this taxon only
			stores.update_all(updated_at: Time.zone.now)
		end
  end
end
