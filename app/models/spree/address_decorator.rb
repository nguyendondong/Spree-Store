module Spree
  Address.class_eval do
		belongs_to :district, class_name: 'Spree::District'
  	# disable validates on city, address, district
    _validators.reject!{ |key, value| key == :city || key == :address1 || key == :district_name }
    _validate_callbacks.each do |callback|
      callback.raw_filter.attributes.reject! { |key| key == :city || key == :address1 || key == :district_name } if callback.raw_filter.respond_to?(:attributes)
    end

  	def phone=(val)
	    write_attribute(:phone, val.gsub(/[- .]/, "")) if val.present?
	  end

	  def alternative_phone=(val)
	  	write_attribute(:alternative_phone, val.gsub(/[- .]/, "")) if val.present?
	  end

	  def formatted_phone
	  	if self.phone.present? && self.phone.length >= 7
		  	formated_phone = self.phone.insert(7," ")
		  	formated_phone = formated_phone.insert(3," ")
		  	if self.phone.length > 12
		  		if(self.phone[0..1] == "01" && self.phone.length > 13)
		  			formated_phone = formated_phone.insert(13, " or ")
			  		
			  	elsif(self.phone[0..1] != "01")
			  		
			  		formated_phone = formated_phone.insert(12, " or ")
			  	end
		  	end
		  end
		  formated_phone
	  end

	  def state_from_ip()
	    begin
	      state = GeoIP.new('db/GeoLiteCity.dat').city(ip)
	      state.present? ? state[:region_name] : ""
	    rescue
	      SystemLogger.create({:name => "State", :content => "Get State : #{$!}", :logger_type => "Error"})
	      return ""
	    end
	  end

	  # check input address with user's ip
	  def check_address()
	  	# fetch lat, lon info from google api (by city and district)
	  	
	  	# fetch lat, lon info from max mind api (by ip)
	  	lat_lon_by_ip()
	  	# if the 2 point reach a thread hold (60KM), this can be a fake order
	  	distance = haversine(district.lat.to_f, district.lon.to_f, latitude.to_f, longtitude.to_f)

	  	return (distance <= 60)
	  end

	  def lat_lon_by_ip()
	  	if(latitude.blank?)
		  	keys = Rails.application.config.api_keys
		  	url = 'https://geoip.maxmind.com/e'
	      apikey = keys[:maxmind]
	      if apikey.present?
	        data = {'l' => apikey, 'i' => self.ip}
	        http_client = HTTPClient.new
	        result = http_client.get(url, data)
	        if result.header.status_code.to_s == "200"
	          result = result.body.split(",")
	          params_result = {:country => result[0],
	                           :state => result[3],
	                           :city => result[4],
	                           :latitude => result[5],
	                           :longitude => result[6],
	                           :options => result}

	          update_attributes(:latitude => result[5], :longtitude => result[6])
	          
	        end
	      end
      end
      {:lat => latitude, :lon => longtitude}
	  end

	  def haversine(lat1, long1, lat2, long2)
		  dtor = Math::PI/180
		  r = 6378.14
		 
		  rlat1 = lat1 * dtor 
		  rlong1 = long1 * dtor 
		  rlat2 = lat2 * dtor 
		  rlong2 = long2 * dtor 
		 
		  dlon = rlong1 - rlong2
		  dlat = rlat1 - rlat2
		 
		  a = power(Math::sin(dlat/2), 2) + Math::cos(rlat1) * Math::cos(rlat2) * power(Math::sin(dlon/2), 2)
		  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
		  d = r * c
		 
		  return d
		end

		def power(num, pow)
			num ** pow
		end
  end
end