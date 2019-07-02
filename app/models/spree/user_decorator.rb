Spree::User.class_eval do
  belongs_to :referer, :class_name => "Spree::User", :foreign_key => :ref_id
  has_many :referred_users, :class_name => "Spree::User", :foreign_key => :ref_id

  has_many :referred_orders, :class_name => "Spree::Order", :foreign_key => :ref_id

  has_many :albums
  has_many :notes, :class_name => "Spree::Note"
  has_many :campaigns

  # attr_accessor :avatar_file_name
  # do_not_validate_attachment_file_type :social_image

  def display_name
    if self.present?
      return self.fb_name unless self.fb_name.blank?
      return self.nickname unless self.nickname.blank?
      return self.email
    end
  end

  def approved_orders
  	Spree::Order.where(:approver_id => id)
  end

  do_not_validate_attachment_file_type :avatar
  has_attached_file :avatar,
    styles: { mini: '48x48>', small: '248x80>', medium: '500x500>' },
    default_style: :medium,
    url: '/users/:id/:style/:basename.:extension',
    path: ':rails_root/public/users/:id/:style/:basename.:extension'
end

