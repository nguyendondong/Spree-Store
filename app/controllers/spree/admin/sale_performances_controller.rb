module Spree
	module Admin
    class SalePerformancesController < ResourceController

      before_filter :init_date_params, :only => [:index]

      def index
        @sales = User.joins(:spree_roles).where("spree_roles.name=?", "sales_rep")
        #Order.group(:approver_id)
        @search = Order.complete.ransack(params[:q])
        @orders = @search.result.where(:approver_id => @sales.select(&:id))
        @reports = {}
        @sales.each {|sale| @reports[sale.id] = {:total_revenue => 0, :total_count => 0, 
          :unprocessed_revenue => 0, :unprocessed_count => 0,
          :ready_revenue => 0, :ready_count => 0,
          :shipped_revenue => 0, :shipped_count => 0,
          :success_revenue => 0, :success_count => 0,
          :paid_revenue => 0, :paid_count => 0,
          :returned_revenue => 0, :returned_count => 0}}
        @orders.each do |order|
          if(order.approver_id.present?)
            @reports[order.approver_id][:total_revenue] += order.total
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
            elsif order.state == "returned"
              @reports[order.approver_id][:returned_revenue] += order.total
              @reports[order.approver_id][:returned_count] += 1
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
end