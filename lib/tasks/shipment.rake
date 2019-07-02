# encoding: utf-8
namespace :shipment do
	def fetch_status(tracking_url)
	  agent = Mechanize.new
	  url = tracking_url
	  doc = agent.get(url)
	  table_info = nil
	  doc.at("#pnView").search("table").each do |table|
	    table.search("span").each do |span|
	      if span.text.include?('(Status Information)')
	        puts "======================="
	        puts span.text
	        table_info = table
	      end
	    end
	  end
	  result = nil
	  if table_info.present? && table_info.at(".mGrid").present? && table_info.at(".mGrid").search("tr").last.present?
	    result = Hash.new
	    table_info.at(".mGrid").search("tr").each do |tr|
	    	tr.search("td").each_with_index do |td, index|
		      key = nil
		      value = td.text.strip
		      if index == 1
		        key = "date"
		      elsif index == 2
		        key = "time"
		      elsif index == 3
		        key = "status"
		      elsif index == 4
		        key = "location"
		      end
		      result[key] = value if key.present?
		      return result if(key == "status" && ["[COD]Đã thu tiền", "Đã Giao", "Chuyển hoàn (Return)"].include?(value))
		    end
	    end
	  end
	  result
  end

  def fetch_delivery_status(tracking_url)
    agent = Mechanize.new
    url = tracking_url
    doc = agent.get(url)
    table_info = nil
    doc.at("#pnView").search("table").each do |table|
      table.search("span").each do |span|
        if span.text.include?('(Delivery Information)')
          puts "======================="
          puts span.text
          table_info = table
        end
      end
    end
    result = nil
    if table_info.present? && table_info.at(".mGrid").present? && table_info.at(".mGrid").search("tr").last.present?
      result = Hash.new
      table_info.at(".mGrid").search("tr").each do |tr|
        tr.search("td").each_with_index do |td, index|
          key = nil
          value = td.text.strip
          if index == 1
            key = "date"
          elsif index == 2
            key = "time"
          elsif index == 3
            key = "po"
          elsif index == 4
            key = "receiver"
          end
          result[key] = value if key.present?
        end
      end
    end
    result
  end

	def ghn_fetch_status(tracking_url)
		#tracking_url = "https://ontime.ghn.vn/Tracking/ViewTracking/7949965212198"
		agent = Mechanize.new
	  url = tracking_url
	  doc = agent.get(url)
	  table_info = nil
	  el = doc.at("li.ordertrackingactive")
	  spans = el.at(".details").search("span")
	  result[status] = spans[0].text
	end
	# fetch shipment status from shipping agencies like vnpost (vnpt)
  task :check_status => :environment do
  	Spree::Shipment.joins(:order).where("spree_shipments.id = 128 AND spree_orders.state=? AND completed_at <= ?","complete", Date.today).shipped.each do |shipment|
  		if shipment.shipping_method.present? && shipment.tracking_url.present?
  			result = fetch_status(shipment.tracking_url)
  		end
  		
  		if result.present?
	  		shipment.update_attribute :status, result["status"]
	  		case result["status"]
          when "[COD]Đã thu tiền", "Đã Giao"
            shipment.finish!
            shipment.order.update_attribute("shipment_state", "shipped_successfully")
          when /(Return)/
            shipment.order.return_authorize
          else
            puts "4444"
            rs2 = fetch_delivery_status(shipment.tracking_url)
            shipment.status = rs2["receiver"] if rs2["receiver"].present?
            if rs2["po"].present? && rs2["po"].split("-").first.present?
              shipment.po_number = rs2["po"].split("-").first.strip
            end
            shipment.save
          # when /(arrival at PO)/
          # 	if(result["location"].index("BCP").present?)
          # 		shipment.order.return_authorize
          # 	end
	  		end
	  		
	  		
	  	end
  	end
  end

  task :fix_status => :environment do
  	Spree::Shipment.where("state=? OR state=? OR state=?", "ready", "shipped", "shipped_successfully").each do |shipment|
			shipment.order.update_attribute(:shipment_state, shipment.state) if shipment.order.present? && shipment.order.shipment_state != shipment.state 
		end
  end
end