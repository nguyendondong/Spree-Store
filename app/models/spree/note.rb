class Spree::Note < ActiveRecord::Base
	belongs_to :notable, polymorphic: true
	belongs_to :user, :class_name => "Spree::User"
	belongs_to :note_template
	belongs_to :lead
end
