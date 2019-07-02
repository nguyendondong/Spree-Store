# encoding: utf-8
class Spree::District < ActiveRecord::Base
  belongs_to :state
  delegate :country, :to => :state, :allow_nil => true
  has_many :addresses, class_name: 'Spree::Address'
  has_many :post_offices
  has_many :leads, class_name: 'Spree::Lead'

  def fetch_lat_lon
  	if(self.latitude.blank?)
  		keys = Rails.application.config.api_keys
  		remove_strings = ["Quận", "Huyện", "Thành phố", "(TP)"]
  		district_name = name
  		city_name = state.name
  		remove_strings.each do |s|
  			district_name = district_name.gsub(s, "").strip
  			city_name = city_name.gsub(s, "").strip
  		end
  		
  		url = URI::encode("https://maps.googleapis.com/maps/api/geocode/json?address=#{district_name},#{city_name}&key=#{keys[:google]}")
  		http = HTTPClient.new
  		result = http.get url
  		result = JSON.parse(result.body)
  		lat_lon = result["results"][0]["geometry"]["location"]
  		self.update_attributes(latitude: lat_lon["lat"], longtitude: lat_lon["lng"])
 
  	end
  	{lat: latitude, lon: longtitude}
  end

  def lat
  	fetch_lat_lon
  	self.latitude
  end

  def lon
  	fetch_lat_lon
  	self.longtitude
  end
end
