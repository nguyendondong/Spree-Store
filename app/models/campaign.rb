class Campaign < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: { scope: :user_id, message: "Campaign already exists." }
	belongs_to :user, :class_name => "Spree::User"
	has_many :orders, :class_name => "Spree::Order"



	def ordered_total
		orders.complete.sum(:total)
	end

	def successful_total
		orders.complete.where(:shipment_state => "shipped_successfully").sum(:total)
	end
end
