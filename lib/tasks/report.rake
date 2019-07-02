namespace :report do
  task report_sold: :environment do
    begin
          #success
      report=Report.find_or_initialize_by(time_report:  Date.today.end_of_day , type_report:0 , state: "shipped_successfully")
      order_available = Spree::Order.where(spree_orders: { updated_at:  DateTime.now.beginning_of_day..DateTime.now.end_of_day})
      order_success =order_available.where(spree_orders: {shipment_state: "shipped_successfully", state: "complete" })
      order_return = order_available.where(spree_orders: {state: "returned"}) 
        report.sale_report = 0 
        report.item_total= 0 
        report.promo_total = 0
        report.item_return= 0 
        report.net_total = 0
        report.shipment_total= 0 
        report.tax_total = 0
        report.total = 0
        report.order_returns = 0
        report.order_counts = 0
        item_sale = 0 
        count_on_hand ={}
         Spree::Product.all.each  do |p|
          count_on_hand[p.id]=p.stock_items.sum(:count_on_hand)
         end
         report.count_on_hand = count_on_hand
          hours={}
          a=[]
          report.order_counts= order_available.where(spree_orders: {shipment_state: "shipped_successfully",state: "complete"}).count
          if order_success.present?
            products={}
            order_success.each do |o|
                item_sale += o.item_total.to_i
                report.promo_total += o.promo_total.to_i  
                report.shipment_total +=  o.shipment_total.to_i
                if (o.additional_tax_total > 0)
                report.tax_total  +=o.additional_tax_total.to_i
                end    
                if hours.has_key? o.created_at.strftime("%k")
                hours[o.created_at.strftime("%k")] += o.total.to_i
                else
                hours[o.created_at.strftime("%k")] = o.total.to_i
                end
                order_items = o.line_items
                order_items.each do |order_item|
                if products.has_key? order_item.variant.product_id
    
                  products[order_item.variant.product_id] += order_item.quantity.to_i
                else
                  
                  products[order_item.variant.product_id] = order_item.quantity.to_i
                end
                end
            end 
              a << products
          end
        report.hours_report = hours
        report.content = a
        order_return = order_available.where(spree_orders: {state: "returned"})
        report.order_returns= order_return.count
         if order_return.present?
          i_return=0
          pr_return = 0
          tax_return = 0 
          order_return.each do |rt|
            i_return += rt.item_total.to_i 
            pr_return +=rt.promo_total.to_i
            tax_return += rt.additional_tax_total.to_i
            end
            report.item_return = i_return + pr_return + tax_return 
         end 
         report.item_total = item_sale
         report.net_total = report.item_total + report.promo_total 
         report.total= report.net_total + report.shipment_total + report.tax_total
         report.sale_report = hours.values.sum
         report.item_total+=report.item_return if report.item_return.present?
      report.save
          #pending
    if order_available.present?
        report=Report.find_or_initialize_by(time_report:  Date.today.end_of_day , type_report:0 , state: "pending")
        report.sale_report = 0 
        report.item_total= 0 
        report.promo_total = 0
        report.item_return= 0 
        report.net_total = 0
        report.shipment_total= 0 
        report.tax_total = 0
        report.total = 0
        report.order_returns = 0
        item_sale = 0 
        report.count_on_hand = {}
          hours={}
          a=[]
          report.order_counts= order_available.where("shipment_state = ? or  shipment_state = ?", "pending","backorder" ).count
          order_pending =order_available.where("shipment_state = ? or  shipment_state = ?", "pending","backorder" )
          if order_pending.present?
            products={}
            order_pending.each do |o|
                item_sale += o.item_total.to_i
                report.promo_total += o.promo_total.to_i  
                report.shipment_total +=  o.shipment_total.to_i
                if (o.additional_tax_total > 0)
                report.tax_total  +=o.additional_tax_total.to_i
                end    
            if hours.has_key? o.created_at.strftime("%k")
            hours[o.created_at.strftime("%k")] += o.total.to_i
            else
            hours[o.created_at.strftime("%k")] = o.total.to_i
            end
            order_items = o.line_items
            order_items.each do |order_item|
              if products.has_key? order_item.variant.product_id
  
                products[order_item.variant.product_id] += order_item.quantity.to_i
              else
                
                products[order_item.variant.product_id] = order_item.quantity.to_i
            end
          end
      end 
      a << products
    end
        report.hours_report = hours
        report.content = a 
        report.item_total = item_sale
         report.net_total = report.item_total + report.promo_total 
         report.total= report.net_total + report.shipment_total + report.tax_total
        report.save
    #ready
        report=Report.find_or_initialize_by(time_report:  Date.today.end_of_day , type_report:0 , state: "ready")
        report.sale_report = 0 
        report.item_total= 0 
        report.promo_total = 0
        report.item_return= 0 
        report.net_total = 0
        report.shipment_total= 0 
        report.tax_total = 0
        report.total = 0
        report.order_returns = 0
        item_sale = 0 
        report.count_on_hand = {}
          hours={}
          a=[]
          report.order_counts= order_available.where(spree_orders: {shipment_state: "ready"}).count
          order_ready =order_available.where(spree_orders: {shipment_state: "ready"})
          if order_ready.present?
            products={}
            order_ready.each do |o|
                item_sale += o.item_total.to_i
                report.promo_total += o.promo_total.to_i  
                report.shipment_total +=  o.shipment_total.to_i
                if (o.additional_tax_total > 0)
                report.tax_total  +=o.additional_tax_total.to_i
                end    
            if hours.has_key? o.created_at.strftime("%k")
            hours[o.created_at.strftime("%k")] += o.total.to_i
            else
            hours[o.created_at.strftime("%k")] = o.total.to_i
            end
            order_items = o.line_items
            order_items.each do |order_item|
              if products.has_key? order_item.variant.product_id
  
                products[order_item.variant.product_id] += order_item.quantity.to_i
              else
                
                products[order_item.variant.product_id] = order_item.quantity.to_i
            end
          end
      end 
      a << products
    end
        report.hours_report = hours
        report.content = a 
        report.item_total = item_sale
         report.net_total = report.item_total + report.promo_total 
         report.total= report.net_total + report.shipment_total + report.tax_total
        report.save
  #shipped
        report=Report.find_or_initialize_by(time_report:  Date.today.end_of_day , type_report:0 , state: "shipped")
        report.sale_report = 0 
        report.item_total= 0 
        report.promo_total = 0
        report.item_return= 0 
        report.net_total = 0
        report.shipment_total= 0 
        report.tax_total = 0
        report.total = 0
        report.order_returns = 0
        item_sale = 0 
        report.count_on_hand = {}
          hours={}
          a=[]
          report.order_counts= order_available.where(spree_orders: {shipment_state: "shipped"}).count
          order_shipped =order_available.where(spree_orders: {shipment_state: "shipped"})
          if order_shipped.present?
            products={}
            order_shipped.each do |o|
                item_sale += o.item_total.to_i
                report.promo_total += o.promo_total.to_i  
                report.shipment_total +=  o.shipment_total.to_i
                if (o.additional_tax_total > 0)
                report.tax_total  +=o.additional_tax_total.to_i
                end    
            if hours.has_key? o.created_at.strftime("%k")
            hours[o.created_at.strftime("%k")] += o.total.to_i
            else
            hours[o.created_at.strftime("%k")] = o.total.to_i
            end
            order_items = o.line_items
            order_items.each do |order_item|
              if products.has_key? order_item.variant.product_id

                products[order_item.variant.product_id] += order_item.quantity.to_i
              else
                
                products[order_item.variant.product_id] = order_item.quantity.to_i
            end
          end
      end 
      a << products
      end
        report.hours_report = hours
        report.content = a 
        report.item_total = item_sale
        report.net_total = report.item_total + report.promo_total 
        report.total= report.net_total + report.shipment_total + report.tax_total
        report.save
      #canceled
      report=Report.find_or_initialize_by(time_report:  Date.today.end_of_day , type_report:0 , state: "canceled")
      report.sale_report = 0 
      report.item_total= 0 
      report.promo_total = 0
      report.item_return= 0 
      report.net_total = 0
      report.shipment_total= 0 
      report.tax_total = 0
      report.total = 0
      report.order_returns = 0
      item_sale = 0 
      report.count_on_hand = {}
        hours={}
        a=[]
        report.order_counts= order_available.where(spree_orders: {state: "canceled"}).count
        order_canceled =order_available.where(spree_orders: {state: "canceled"})
        if order_canceled.present?
          products={}
          order_canceled.each do |o|
              item_sale += o.item_total.to_i
              report.promo_total += o.promo_total.to_i  
              report.shipment_total +=  o.shipment_total.to_i
              if (o.additional_tax_total > 0)
              report.tax_total  +=o.additional_tax_total.to_i
              end    
          if hours.has_key? o.created_at.strftime("%k")
          hours[o.created_at.strftime("%k")] += o.total.to_i
          else
          hours[o.created_at.strftime("%k")] = o.total.to_i
          end
          order_items = o.line_items
          order_items.each do |order_item|
            if products.has_key? order_item.variant.product_id

              products[order_item.variant.product_id] += order_item.quantity.to_i
            else
              
              products[order_item.variant.product_id] = order_item.quantity.to_i
          end
        end
    end 
    a << products
    end
      report.hours_report = hours
      report.content = a 
      report.item_total = item_sale
      report.net_total = report.item_total + report.promo_total 
      report.total= report.net_total + report.shipment_total + report.tax_total
      report.save
    #returned
    report=Report.find_or_initialize_by(time_report:  Date.today.end_of_day , type_report:0 , state: "returned")
        report.sale_report = 0 
        report.item_total= 0 
        report.promo_total = 0
        report.item_return= 0 
        report.net_total = 0
        report.shipment_total= 0 
        report.tax_total = 0
        report.total = 0
        report.order_returns = 0
        item_sale = 0 
        report.count_on_hand = {}
          hours={}
          a=[]
          report.order_counts= order_available.where("state = ? or  state = ?", "returned","awaiting_return" ).count
          order_returned =order_available.where("state = ? or  state = ?", "returned","awaiting_return" )
          if order_returned.present?
            products={}
            order_returned.each do |o|
                item_sale += o.item_total.to_i
                report.promo_total += o.promo_total.to_i  
                report.shipment_total +=  o.shipment_total.to_i
                if (o.additional_tax_total > 0)
                report.tax_total  +=o.additional_tax_total.to_i
                end    
            if hours.has_key? o.created_at.strftime("%k")
            hours[o.created_at.strftime("%k")] += o.total.to_i
            else
            hours[o.created_at.strftime("%k")] = o.total.to_i
            end
            order_items = o.line_items
            order_items.each do |order_item|
              if products.has_key? order_item.variant.product_id
  
                products[order_item.variant.product_id] += order_item.quantity.to_i
              else
                
                products[order_item.variant.product_id] = order_item.quantity.to_i
            end
          end
      end 
      a << products
      end
        report.hours_report = hours
        report.content = a 
        report.item_total = item_sale
        report.net_total = report.item_total + report.promo_total 
        report.total= report.net_total + report.shipment_total + report.tax_total
        report.save
    end

      #HOURS _REPORT
      order_available = Spree::Order.where(spree_orders: { updated_at:  DateTime.now.beginning_of_hour..DateTime.now.end_of_hour})
      if order_available.present?
      order_success =order_available.where(spree_orders: {shipment_state: "shipped_successfully", state: "complete" })
      order_return = order_available.where(spree_orders: {state: "returned",updated_at:  DateTime.now.beginning_of_hour..DateTime.now.end_of_hour })
      hour_sold=Report.find_or_initialize_by(time_report: DateTime.now.beginning_of_hour , type_report:1 , state: "shipped_successfully") 
        hour_sold.sale_report = 0 
        hour_sold.item_total= 0 
        hour_sold.promo_total = 0
        hour_sold.item_return= 0 
        hour_sold.net_total = 0
        hour_sold.shipment_total= 0 
        hour_sold.tax_total = 0
        hour_sold.total = 0
        hour_sold.order_returns = 0
        hour_sold.order_counts = 0 
        item_sale = 0
      if order_success.present?
        hours={}
        a=[]
        products={}
        hour_sold.order_counts= order_available.where(spree_orders: {shipment_state: "shipped_successfully" , state: "complete"}).count
        order_success.each do |o|
          item_sale += o.item_total.to_i
          hour_sold.promo_total += o.promo_total.to_i  
          hour_sold.shipment_total +=  o.shipment_total.to_i
          if (o.additional_tax_total > 0)
          hour_sold.tax_total  +=o.additional_tax_total.to_i
          end
          if hours.has_key? o.created_at.strftime("%k")
            hours[o.created_at.strftime("%k")] += o.total.to_i
          else
            hours[o.created_at.strftime("%k")] = o.total.to_i
          end
          order_items = o.line_items
              order_items.each do |order_item|
                if products.has_key? order_item.variant.product_id
  
                  products[order_item.variant.product_id] += order_item.quantity.to_i
                else
                  
                  products[order_item.variant.product_id] = order_item.quantity.to_i
                end

              end
              
        end
        a << products
        hour_sold.hours_report = hours
        hour_sold.content = a
        end
        hour_sold.order_returns= order_return.count
        if order_return.present?
          i_return=0
          pr_return = 0
          tax_return = 0 
          order_return.each do |rt|
            i_return += rt.item_total.to_i 
            pr_return +=rt.promo_total.to_i
            tax_return += rt.additional_tax_total.to_i
            end
            hour_sold.item_return = i_return + pr_return + tax_return 
        end
        hour_sold.item_total = item_sale
          hour_sold.net_total = hour_sold.item_total + hour_sold.promo_total 
          hour_sold.total= hour_sold.net_total + hour_sold.shipment_total + hour_sold.tax_total
          hour_sold.sale_report = hour_sold.hours_report.values.sum
          hour_sold.item_total+=hour_sold.item_return if hour_sold.item_return.present? 
          hour_sold.save

#pending
hour_sold=Report.find_or_initialize_by(time_report: DateTime.now.beginning_of_hour , type_report:1 , state: "pending")
hour_sold.sale_report = 0 
hour_sold.item_total= 0 
hour_sold.promo_total = 0
hour_sold.item_return= 0 
hour_sold.net_total = 0
hour_sold.shipment_total= 0 
hour_sold.tax_total = 0
hour_sold.total = 0
hour_sold.order_returns = 0
item_sale = 0 
hour_sold.count_on_hand = {}
    hours={}
    a=[]
hour_sold.order_counts= order_available.where("shipment_state = ? or  shipment_state = ?", "pending","backorder" ).count
order_pending =order_available.where("shipment_state = ? or  shipment_state = ?", "pending","backorder"  )
if order_pending.present?
products={}
order_pending.each do |o|
    item_sale += o.item_total.to_i
    hour_sold.promo_total += o.promo_total.to_i  
    hour_sold.shipment_total +=  o.shipment_total.to_i
    if (o.additional_tax_total > 0)
    hour_sold.tax_total  +=o.additional_tax_total.to_i
    end    
if hours.has_key? o.created_at.strftime("%k")
hours[o.created_at.strftime("%k")] += o.total.to_i
else
hours[o.created_at.strftime("%k")] = o.total.to_i
end
order_items = o.line_items
order_items.each do |order_item|
  if products.has_key? order_item.variant.product_id

    products[order_item.variant.product_id] += order_item.quantity.to_i
  else
    
    products[order_item.variant.product_id] = order_item.quantity.to_i
end
end
end 
a << products
end
hour_sold.hours_report = hours
hour_sold.content = a 
hour_sold.item_total = item_sale
hour_sold.net_total = hour_sold.item_total + hour_sold.promo_total 
hour_sold.total= hour_sold.net_total + hour_sold.shipment_total + hour_sold.tax_total
hour_sold.save
#ready
    hour_sold=Report.find_or_initialize_by(time_report: DateTime.now.beginning_of_hour , type_report:1 , state: "ready")
    hour_sold.sale_report = 0 
    hour_sold.item_total= 0 
    hour_sold.promo_total = 0
    hour_sold.item_return= 0 
    hour_sold.net_total = 0
    hour_sold.shipment_total= 0 
    hour_sold.tax_total = 0
    hour_sold.total = 0
    hour_sold.order_returns = 0
    item_sale = 0 
    hour_sold.count_on_hand = {}
      hours={}
      a=[]
      hour_sold.order_counts= order_available.where(spree_orders: {shipment_state: "ready"}).count
      order_ready =order_available.where(spree_orders: {shipment_state: "ready"})
      if order_ready.present?
        products={}
        order_ready.each do |o|
            item_sale += o.item_total.to_i
            hour_sold.promo_total += o.promo_total.to_i  
            hour_sold.shipment_total +=  o.shipment_total.to_i
            if (o.additional_tax_total > 0)
            hour_sold.tax_total  +=o.additional_tax_total.to_i
            end    
        if hours.has_key? o.created_at.strftime("%k")
        hours[o.created_at.strftime("%k")] += o.total.to_i
        else
        hours[o.created_at.strftime("%k")] = o.total.to_i
        end
        order_items = o.line_items
        order_items.each do |order_item|
          if products.has_key? order_item.variant.product_id

            products[order_item.variant.product_id] += order_item.quantity.to_i
          else
            
            products[order_item.variant.product_id] = order_item.quantity.to_i
            end
          end
        end 
          a << products
      end
    hour_sold.hours_report = hours
    hour_sold.content = a 
    hour_sold.item_total = item_sale
    hour_sold.net_total = hour_sold.item_total + hour_sold.promo_total 
    hour_sold.total= hour_sold.net_total + hour_sold.shipment_total + hour_sold.tax_total
    hour_sold.save
#shipped
    hour_sold=Report.find_or_initialize_by(time_report: DateTime.now.beginning_of_hour , type_report:1, state: "shipped")
    hour_sold.sale_report = 0 
    hour_sold.item_total= 0 
    hour_sold.promo_total = 0
    hour_sold.item_return= 0 
    hour_sold.net_total = 0
    hour_sold.shipment_total= 0 
    hour_sold.tax_total = 0
    hour_sold.total = 0
    hour_sold.order_returns = 0
    item_sale = 0 
    hour_sold.count_on_hand = {}
      hours={}
      a=[]
      hour_sold.order_counts= order_available.where(spree_orders: {shipment_state: "shipped"}).count
      order_shipped =order_available.where(spree_orders: {shipment_state: "shipped"})
      if order_shipped.present?
              products={}
              order_shipped.each do |o|
                  item_sale += o.item_total.to_i
                  hour_sold.promo_total += o.promo_total.to_i  
                  hour_sold.shipment_total +=  o.shipment_total.to_i
                  if (o.additional_tax_total > 0)
                  hour_sold.tax_total  +=o.additional_tax_total.to_i
                  end    
              if hours.has_key? o.created_at.strftime("%k")
              hours[o.created_at.strftime("%k")] += o.total.to_i
              else
              hours[o.created_at.strftime("%k")] = o.total.to_i
              end
              order_items = o.line_items
              order_items.each do |order_item|
                if products.has_key? order_item.variant.product_id

                  products[order_item.variant.product_id] += order_item.quantity.to_i
                else
                  
                  products[order_item.variant.product_id] = order_item.quantity.to_i
              end
            end
        end 
        a << products
  end
    hour_sold.hours_report = hours
    hour_sold.content = a 
    hour_sold.item_total = item_sale
    hour_sold.net_total = hour_sold.item_total + hour_sold.promo_total 
    hour_sold.total= hour_sold.net_total + hour_sold.shipment_total + hour_sold.tax_total
    hour_sold.save
  #canceled
  hour_sold=Report.find_or_initialize_by(time_report:  DateTime.now.beginning_of_hour , type_report:1, state: "canceled")
  hour_sold.sale_report = 0 
  hour_sold.item_total= 0 
  hour_sold.promo_total = 0
  hour_sold.item_return= 0 
  hour_sold.net_total = 0
  hour_sold.shipment_total= 0 
  hour_sold.tax_total = 0
  hour_sold.total = 0
  hour_sold.order_returns = 0
  item_sale = 0 
  hour_sold.count_on_hand = {}
    hours={}
    a=[]
    hour_sold.order_counts= order_available.where(spree_orders: {state: "canceled"}).count
    order_canceled =order_available.where(spree_orders: {state: "canceled"})
    if order_canceled.present?
              products={}
              order_canceled.each do |o|
                  item_sale += o.item_total.to_i
                  hour_sold.promo_total += o.promo_total.to_i  
                  hour_sold.shipment_total +=  o.shipment_total.to_i
                  if (o.additional_tax_total > 0)
                  hour_sold.tax_total  +=o.additional_tax_total.to_i
                  end    
                  if hours.has_key? o.created_at.strftime("%k")
                  hours[o.created_at.strftime("%k")] += o.total.to_i
                  else
                  hours[o.created_at.strftime("%k")] = o.total.to_i
                  end
                  order_items = o.line_items
                  order_items.each do |order_item|
                    if products.has_key? order_item.variant.product_id

                      products[order_item.variant.product_id] += order_item.quantity.to_i
                    else
                      
                      products[order_item.variant.product_id] = order_item.quantity.to_i
                    end
                  end
              end 
        a << products
      end
  hour_sold.hours_report = hours
  hour_sold.content = a 
  hour_sold.item_total = item_sale
  hour_sold.net_total = hour_sold.item_total + hour_sold.promo_total 
  hour_sold.total= hour_sold.net_total + hour_sold.shipment_total + hour_sold.tax_total
  hour_sold.save
#return
    hour_sold=Report.find_or_initialize_by(time_report:  DateTime.now.beginning_of_hour , type_report:1 , state: "returned")
    hour_sold.sale_report = 0 
    hour_sold.item_total= 0 
    hour_sold.promo_total = 0
    hour_sold.item_return= 0 
    hour_sold.net_total = 0
    hour_sold.shipment_total= 0 
    hour_sold.tax_total = 0
    hour_sold.total = 0
    hour_sold.order_returns = 0
    item_sale = 0 
    hour_sold.count_on_hand = {}
      hours={}
      a=[]
      hour_sold.order_counts= order_available.where("state = ? or  state = ?", "returned","awaiting_return" ).count
      order_pending =order_available.where("state = ? or  state = ?", "returned","awaiting_return" )
      if order_pending.present?
                products={}
                order_pending.each do |o|
                          item_sale += o.item_total.to_i
                          hour_sold.promo_total += o.promo_total.to_i  
                          hour_sold.shipment_total +=  o.shipment_total.to_i
                          if (o.additional_tax_total > 0)
                          hour_sold.tax_total  +=o.additional_tax_total.to_i
                          end    
                          if hours.has_key? o.created_at.strftime("%k")
                          hours[o.created_at.strftime("%k")] += o.total.to_i
                          else
                          hours[o.created_at.strftime("%k")] = o.total.to_i
                          end
                      order_items = o.line_items
                      order_items.each do |order_item|
                        if products.has_key? order_item.variant.product_id

                          products[order_item.variant.product_id] += order_item.quantity.to_i
                        else
                          
                          products[order_item.variant.product_id] = order_item.quantity.to_i
                        end
                      end
                end 
          a << products
        end
          hour_sold.hours_report = hours
          hour_sold.content = a 
          hour_sold.item_total = item_sale
          hour_sold.net_total = hour_sold.item_total + hour_sold.promo_total 
          hour_sold.total= hour_sold.net_total + hour_sold.shipment_total + hour_sold.tax_total
          hour_sold.save
      end  
    puts "Success at: #{Time.now}"
  rescue
    puts "Error at: #{Time.now}"
  end
  end
end