module Spree
	Admin::ReportsController.class_eval do

    before_filter :init_date_params, :only => [:sale_performances, :sales_total, :daily]

		def initialize
      super
      Spree::Admin::ReportsController.add_available_report!(:sales_total)
      Spree::Admin::ReportsController.add_available_report!(:top_products)
      Spree::Admin::ReportsController.add_available_report!(:returning_customer)
      Spree::Admin::ReportsController.add_available_report!(:traffic_referrer)
      Spree::Admin::ReportsController.add_available_report!(:top_cities)
    end
    def index
      @reports = Spree::Admin::ReportsController.available_reports
      @sale_todays= Order.where(spree_orders: {shipment_state: "shipped_successfully", created_at:  (Time.now.beginning_of_day)..(Time.now.end_of_day)})
      @sale_one_weeks = Order.where(spree_orders: {shipment_state: "shipped_successfully", created_at:  1.week.ago(DateTime.now)..(DateTime.now)})
      @sale_one_months = Order.where(spree_orders: {shipment_state: "shipped_successfully", created_at:  1.month.ago(DateTime.now)..(DateTime.now)})
      @sale_three_months = Order.where(spree_orders: {shipment_state: "shipped_successfully", created_at:  3.months.ago(DateTime.now)..(DateTime.now)})
      @sale_one_years = Order.where(spree_orders: {shipment_state: "shipped_successfully", created_at:  1.year.ago(DateTime.now)..(DateTime.now)})

      @order_todays = Order.where(spree_orders: {created_at:  (Time.now.beginning_of_day)..(Time.now.end_of_day)})
      @order_weeks = Order.where(spree_orders: {created_at:  1.week.ago(DateTime.now)..(DateTime.now)})
      @order_months =  Order.where(spree_orders: {created_at:  1.month.ago(DateTime.now)..(DateTime.now)})
      @order_three_months = Order.where(spree_orders: { created_at:  3.months.ago(DateTime.now)..(DateTime.now)})
      @order_years =  Order.where(spree_orders: { created_at:  1.year.ago(DateTime.now)..(DateTime.now)})

      @this_month = Time.now.strftime("%m/%Y")
      @last_month = 1.month.ago.strftime("%m/%Y")

      @arr_day_of_this_month = (Time.now.utc.beginning_of_month.to_date..Time.now.utc.end_of_month.to_date).to_a
      @day_utc = @arr_day_of_this_month.map{|x| x.to_time.utc.end_of_day.to_i}
      @data_chart_this_month = @day_utc.map{|m|  Report.where(time_report: m).first.try(:sale_report).to_i }

      @total_revenue_this_month = Spree::Order.where(spree_orders: {shipment_state: "shipped_successfully", created_at:  (Time.now.utc.beginning_of_month.to_date..Time.now.utc.end_of_month.to_date)})
    end

    def top_products
      @reports = Spree::Admin::ReportsController.available_reports
      @days = params[:days].to_i > 0 ? params[:days].to_i : 30
    	@line_items = LineItem.select("sku, variant_id, price, sum(quantity) as quantity").joins(:variant).joins(:order)
				.where("spree_orders.completed_at >= ?", @days.days.ago)
				.where("spree_orders.shipment_state = ?", "shipped_successfully")
				.group(:variant_id).order("quantity desc").limit(100)

    end

    def top_cities
      @reports = Spree::Admin::ReportsController.available_reports
    	@cities = Order.select("sum(total) as total_value, 0 as total_success_value, sum(item_count) as item_count, count(*) as order_count, city, state_id").joins(:bill_address).where("spree_orders.completed_at is not null AND spree_orders.state <> ?", "canceled").group("state_id").order("total_value desc")
    	@cities = @cities.map do |city|
    		city.total_success_value = Order.joins(:bill_address).where("spree_orders.state = ? AND spree_orders.shipment_state = ? AND state_id=?", "complete", "shipped_successfully", city.state_id).sum(:total)
    		city
    	end
    end

    def sale_performances
      @sales = User.joins(:spree_roles).where("spree_roles.name=?", "sales_rep")
      #Order.group(:approver_id)
      @search = Order.complete.ransack(params[:q])
      @orders = @search.result.where(:approver_id => @sales.select(&:id))
      @reports = {}
      @creator_reports = {}
      @sales.each do |sale|
        @reports[sale.id] = {:total_revenue => 0, :total_count => 0,
        :unprocessed_revenue => 0, :unprocessed_count => 0,
        :ready_revenue => 0, :ready_count => 0,
        :shipped_revenue => 0, :shipped_count => 0,
        :success_revenue => 0, :success_count => 0,
        :paid_revenue => 0, :paid_count => 0}

        @creator_reports[sale.id] = {:total_revenue => 0, :total_count => 0,
        :unprocessed_revenue => 0, :unprocessed_count => 0,
        :ready_revenue => 0, :ready_count => 0,
        :shipped_revenue => 0, :shipped_count => 0,
        :success_revenue => 0, :success_count => 0,
        :paid_revenue => 0, :paid_count => 0}
      end
      @creators = @sales.to_a.clone
      @creators.push(User.new(email: "Others", nickname: "Others", id: 9999))
      @creators.push(User.new(email: "No user", nickname: "No user", id: 0))
      @creators.each do |sale|
        @creator_reports[sale.id] = {:total_revenue => 0, :total_count => 0,
        :unprocessed_revenue => 0, :unprocessed_count => 0,
        :ready_revenue => 0, :ready_count => 0,
        :shipped_revenue => 0, :shipped_count => 0,
        :success_revenue => 0, :success_count => 0,
        :paid_revenue => 0, :paid_count => 0}
      end
      @orders.each do |order|
        if(order.approver_id.present?)
          @reports[order.approver_id][:total_revenue] += order.item_total
          @reports[order.approver_id][:total_count] += 1
          if order.state == "complete"
            if order.shipment_state == "pending"
              @reports[order.approver_id][:unprocessed_revenue] += order.total
              @reports[order.approver_id][:unprocessed_count] += 1
            elsif order.shipment_state == "ready"
              @reports[order.approver_id][:ready_revenue] += order.total
              @reports[order.approver_id][:ready_count] += 1
            elsif order.shipment_state == "shipped"
              @reports[order.approver_id][:shipped_revenue] += order.total
              @reports[order.approver_id][:shipped_count] += 1
            elsif order.shipment_state == "shipped_successfully"
              @reports[order.approver_id][:success_revenue] += order.total
              @reports[order.approver_id][:success_count] += 1
            end
          end
        end
        user_id = order.user_id.present? ? order.user_id : 0
        sale_ids = @sales.map(&:id)
        user_id = 9999 if user_id != 0 && !sale_ids.include?(user_id)
        @creator_reports[user_id][:total_revenue] += order.item_total
        @creator_reports[user_id][:total_count] += 1
        if order.state == "complete"
          if order.shipment_state == "pending"
            @creator_reports[user_id][:unprocessed_revenue] += order.total
            @creator_reports[user_id][:unprocessed_count] += 1
          elsif order.shipment_state == "ready"
            @creator_reports[user_id][:ready_revenue] += order.total
            @creator_reports[user_id][:ready_count] += 1
          elsif order.shipment_state == "shipped"
            @creator_reports[user_id][:shipped_revenue] += order.total
            @creator_reports[user_id][:shipped_count] += 1
          elsif order.shipment_state == "shipped_successfully"
            @creator_reports[user_id][:success_revenue] += order.total
            @creator_reports[user_id][:success_count] += 1
          end
        end
      end
      paid_orders = Spree::Order.complete.where(:state => "complete")
            .where(:payment_state => "paid").joins(:payments)
            .where("spree_payments.updated_at >= ?", params[:q][:completed_at_gt])
            .where("spree_payments.updated_at <= ?", params[:q][:completed_at_lt])
            .where("spree_orders.approved_at >= ?", "2015-05-01".to_time)
            .select("distinct number, total, approver_id")
      paid_orders.each do |order|
        @reports[order["approver_id"]][:paid_revenue] += order["total"] if @reports[order["approver_id"]].present?
        @reports[order["approver_id"]][:paid_count] += 1 if @reports[order["approver_id"]].present?
      end

      #@creators.push(User.new(email: "9999", nickname: "9999", id: 9999))
    end

    def sales_total
      @reports = Spree::Admin::ReportsController.available_reports
        respond_to do |format|
          format.html
          format.js
          format.json { render :json => get_data_sales_total }
        end
    end
    def traffic_referrer
      @reports = Spree::Admin::ReportsController.available_reports
    end
    def returning_customer
      @reports = Spree::Admin::ReportsController.available_reports

    end
    private
    def get_data_sales_total
          

          if   params[:val2] != "0"
            p "===tuy chinh===="
            value2 = params[:val2].to_date
            value =   params[:val1].to_date 
            return data_sale_total(value,value2)
          else
            p "===== ko tuy chinh===="
            value2 =  Date.today
            value =   params[:val1].to_date
            return data_sale_total(value,value2)
          end
           
    end
    def  data_sale_total(value,value2)
      count_date =(value.to_date..value2.to_date).count
      p "--So ngay report:---"
      p count_date
      day_array =(value.to_date..value2.to_date).to_a
      d = {}
      d["state_eq"]="shipped_successfully"
       
      d["time_report_gteq"] = value
      d["type_report_eq"]= 0
      search_day={}
      search_day["time_report_gteq"] =  value
      @search = ::Report.ransack(search_day)
      data_chart=@search.result(distinct: true)
      dataNameChart = day_array.map{|k| k.strftime(" %d/%m")}
      

        # > 3 ngay 
        if  count_date > 3&& count_date < 90 && data_chart.present?
          susccess_total = Array.new(count_date,0)
          pending_total = Array.new(count_date,0)
          ready_total =Array.new(count_date,0)
          shipped_total = Array.new(count_date,0)
          returned_total =Array.new(count_date,0)
          canceled_total =Array.new(count_date,0)
          susccess_order = Array.new(count_date,0)
          pending_order = Array.new(count_date,0)
          ready_order =Array.new(count_date,0)
          shipped_order = Array.new(count_date,0)
          returned_order =Array.new(count_date,0)
          canceled_order =Array.new(count_date,0)
            day_array.each_with_index do  |day,index|
              rp_susccess = data_chart.where(reports: {time_report:  day.end_of_day , type_report:0 ,state: "shipped_successfully" } )
              if rp_susccess.present?
                susccess_total[index] = rp_susccess.last.total
                susccess_order[index] = rp_susccess.last.order_counts
              end
              rp_pending = data_chart.where(reports: {time_report:  day.end_of_day , type_report:0 ,state: "pending" } )
              if rp_pending.present?
                pending_total[index] = rp_pending.last.total
                pending_order[index] = rp_pending.last.order_counts
              end
              rp_ready = data_chart.where(reports: {time_report:  day.end_of_day , type_report:0 ,state: "ready" } )
              if rp_ready.present?
                ready_total[index] = rp_ready.last.total
                ready_order[index] = rp_ready.last.order_counts
              end
              rp_shipped = data_chart.where(reports: {time_report:  day.end_of_day , type_report:0 ,state: "shipped" } )
              if rp_shipped.present?
                shipped_total[index] = rp_shipped.last.total
                shipped_order[index] = rp_shipped.last.order_counts
              end
              rp_returned = data_chart.where(reports: {time_report:  day.end_of_day , type_report:0 ,state: "returned" } )
              if rp_returned.present?
                returned_total[index] = rp_returned.last.total
                returned_order[index] = rp_returned.last.order_counts
              end
              rp_canceled = data_chart.where(reports: {time_report:  day.end_of_day , type_report:0 ,state: "canceled" } )
              if rp_canceled.present?
                canceled_total[index] = rp_canceled.last.total
                canceled_order[index] = rp_canceled.last.order_counts
              end
            end   
        end
       
        #hom nay
        if  count_date == 1 && data_chart.present?
          hour = (0..23).map{ |k|Date.today.beginning_of_day + k.hour}
          susccess_total = Array.new(24,0)
          pending_total = Array.new(24,0)
          ready_total =Array.new(24,0)
          shipped_total = Array.new(24,0)
          returned_total =Array.new(24,0)
          canceled_total =Array.new(24,0)
          susccess_order = Array.new(24,0)
          pending_order = Array.new(24,0)
          ready_order =Array.new(24,0)
          shipped_order = Array.new(24,0)
          returned_order =Array.new(24,0)
          canceled_order =Array.new(24,0)
          dataNameChart = hour.map{|k| k.strftime(" %k:00")}
          hour.each_with_index do |hour, index|
          rp_susccess = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "shipped_successfully" } )
            if rp_susccess.present?
              susccess_total[index]=rp_susccess.last.total
              susccess_order[index]=rp_susccess.last.order_counts
            end
            rp_pending = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "pending" } )
            if rp_pending.present?
              pending_total[index]=rp_pending.last.total
              pending_order[index]=rp_pending.last.order_counts
            end
            rp_ready = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "ready" } )
            if rp_ready.present?
              ready_total[index]=rp_ready.last.total
              ready_order[index]=rp_ready.last.order_counts
            end
            rp_shipped = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "shipped" } )
            if rp_shipped.present?
              shipped_total[index]=rp_shipped.last.total
              shipped_order[index]=rp_shipped.last.order_counts

            end
            rp_returned = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "returned" } )
            if rp_returned.present?
              returned_total[index]=rp_returned.last.total
              p index
              returned_order[index]=rp_returned.last.order_counts
            end
            rp_canceled = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "canceled" } )
            if rp_canceled.present?
              canceled_total[index]=rp_canceled.last.total
              canceled_order[index]=rp_canceled.last.order_counts
            end
          end
          d["time_report_lteq"] = Date.today.end_of_day
          d["time_report_gteq"] =Date.today.beginning_of_day 
          d["type_report_eq"]= 1
        end

        #hom qua
        if count_date==2 && data_chart.present?
          hour = (0..23).map{ |k|1.day.ago.beginning_of_day + k.hour}
          susccess_total = Array.new(24,0)
          pending_total = Array.new(24,0)
          ready_total =Array.new(24,0)
          shipped_total = Array.new(24,0)
          returned_total =Array.new(24,0)
          canceled_total =Array.new(24,0)
          susccess_order = Array.new(24,0)
          pending_order = Array.new(24,0)
          ready_order =Array.new(24,0)
          shipped_order = Array.new(24,0)
          returned_order =Array.new(24,0)
          canceled_order =Array.new(24,0)
          dataNameChart = hour.map{|k| k.strftime(" %k:00")}
          hour.each_with_index do |hour, index|
            
          rp_susccess = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "shipped_successfully" } )
            if rp_susccess.present?
              susccess_total[index]=rp_susccess.last.total
              susccess_order[index]=rp_susccess.last.order_counts
            end
            rp_pending = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "pending" } )
            if rp_pending.present?
              pending_total[index]=rp_pending.last.total
              pending_order[index]=rp_pending.last.order_counts
            end
            rp_ready = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "ready" } )
            if rp_ready.present?
              ready_total[index]=rp_ready.last.total
              ready_order[index]=rp_ready.last.order_counts
            end
            rp_shipped = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "shipped" } )
            if rp_shipped.present?
              shipped_total[index]=rp_shipped.last.total
              shipped_order[index]=rp_shipped.last.order_counts

            end
            rp_returned = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "returned" } )
            if rp_returned.present?
              returned_total[index]=rp_returned.last.total
              p index
              returned_order[index]=rp_returned.last.order_counts
            end
            rp_canceled = data_chart.where(reports: {time_report:  hour, type_report:1 ,state: "canceled" } )
            if rp_canceled.present?
              canceled_total[index]=rp_canceled.last.total
              canceled_order[index]=rp_canceled.last.order_counts
            end
          end
          d["time_report_lteq"] = 1.day.ago.end_of_day
          d["time_report_gteq"] =1.day.ago.beginning_of_day 
          d["type_report_eq"]= 1
          
        end

        @search = ::Report.ransack(d)
        a = @search.result(distinct: true)

        c_totals = []
        c_totals << pending_total <<  ready_total <<  shipped_total <<  susccess_total <<  canceled_total << returned_total
        c_orders = []
        c_orders << pending_order <<  ready_order <<  shipped_order <<  susccess_order <<  canceled_order << returned_order
        return {dataSearch: a.as_json(methods: [:date_report]),data1: c_totals, data2: c_orders, data3: dataNameChart}
      
    end
    def set_report(key, order = nil)
      @totals[key] = { :order_count => 0, :item_count => 0, :item_total => ::Money.new(0, "VND"), :adjustment_total => ::Money.new(0, "VND"), :sales_total => ::Money.new(0, "VND") } unless @totals[key]
      if(order.present?)
        @totals[key][:order_count] += 1 if order.item_count > 0
        @totals[key][:item_count] += order.item_count
        @totals[key][:item_total] += order.display_item_total.money
        @totals[key][:adjustment_total] += order.display_adjustment_total.money
        @totals[key][:sales_total] += order.display_total.money
      end
    end

    def set_daily_report(key, order)
      if order.present?
        @totals[key][order.completed_at.strftime("%Y-%m-%d")][0] += 1
        @totals[key][order.completed_at.strftime("%Y-%m-%d")][1] += order.item_total
      end
    end

    def init_date_params
      params[:q] = {} unless params[:q]

      if params[:q][:completed_at_gt].present?
        params[:q][:completed_at_gt] = Time.zone.parse(params[:q][:completed_at_gt]).beginning_of_day rescue ""
      else
        params[:q][:completed_at_gt] = Date.today.beginning_of_month rescue ""
      end

      if params[:q][:completed_at_lt].present?
        params[:q][:completed_at_lt] = Time.zone.parse(params[:q][:completed_at_lt]).end_of_day rescue ""
      else
        params[:q][:completed_at_lt] = Time.zone.parse(Date.today.strftime("%d/%m/%Y")).end_of_day rescue ""
      end

      params[:q][:s] ||= "completed_at asc"
    end
	end
end