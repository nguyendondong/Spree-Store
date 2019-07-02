namespace :orders do

  task :assign => :environment do
  	orders = Spree::Order.where("created_at <= ?", 1.month.ago.end_of_month).where("approver_id is null").where(:state => "complete")
  	i = 0
  	sale_emails = %w( sale01@donghox.com sale02@donghox.com sale04@donghox.com )
  	sales = Spree::User.where("email in (?)",  sale_emails)

  	orders.each do |order|
  		order.update_attribute(:approver_id, sales[i].id)
  		i += 1
  		i = 0 if (i >= 3)
  	end

  end

  task :assign_shipping_orders => :environment do
  	orders = Spree::Order.where("created_at <= ?", 1.month.ago.end_of_month).where(:state => "complete", :shipment_state => "shipped")
  	i = 0
  	sale_emails = %w( sale01@donghox.com sale02@donghox.com sale04@donghox.com )
  	sales = Spree::User.where("email in (?)",  sale_emails)

  	orders.each do |order|
  		order.update_attribute(:approver_id, sales[i].id)
  		i += 1
  		i = 0 if (i >= 3)
  	end
  end
end