namespace :district do

  task :import => :environment do
  	f = File.open("/Users/mac/Workspace/muamely/donghox/lib/huyen.txt", "r")
  	city = nil
		f.each_line do |line|
		  next if line.blank?
		  
		  if(line.index(". ") == 2)
		  	line = line[4..line.length-1]
		  	name = if(line.index(" ") == 4) # tinh
		  		line[5..line.length]
		  	else # thanh pho
		  		line[10..line.length]
		  	end
		  	city = Spree::State.where("name like :name", {:name => "%#{name.strip()}%"}).first
		  	
		  else # huyen
		  	puts city.name if city.present?
		  	Spree::District.create(name: line[5..line.length-1].strip(), state_id: city.id) if city.present?
		  end
		end
		f.close
  end
end