class Picture < ActiveRecord::Base
    # attr_accessor :lead_id
    belongs_to :lead

    has_attached_file :image,
    styles: { med: "200x200"  },
        default_style: :med,
        url: '/spree/leads/:id/image/:style/:basename.:extension',
        path: ':rails_root/public/spree/leads/:id/image/:style/:basename.:extension',
        default_url: '/assets/default_leads.png'
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  end
