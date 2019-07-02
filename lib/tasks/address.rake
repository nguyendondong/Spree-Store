namespace :address do
	task :update_district_id => :environment do
		Spree::Address.all.each do |address|
			district = Spree::District.find_by_name(address.district_name) if address.district_name.present?
			address.update_attribute :district_id, district.id if district.present?
		end
	end
end