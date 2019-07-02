module Spree
  Admin::OrdersController.class_eval do

    def index
      params[:q] ||= {}
      @show_only_unprocessed = params[:show_only_unprocessed] == '1'
      if @show_only_unprocessed
        params[:q][:approver_id_null] = '1'
      end
      params[:q][:completed_at_not_null] ||= '1' if Spree::Config[:show_only_complete_orders_by_default]
      @show_only_completed = params[:q][:completed_at_not_null] == '1'
      params[:q][:approver_id_eq] ||= spree_current_user.id.to_s if @show_only_unprocessed && spree_current_user.has_spree_role?('sales_rep')
      @show_only_my_orders = params[:q][:approver_id_eq] == spree_current_user.id.to_s
      params[:q].delete(:approver_id_eq) if params[:q][:approver_id_eq] == '0'
      params[:q][:s] ||= @show_only_completed ? 'completed_at desc' : 'created_at desc'

      # As date params are deleted if @show_only_completed, store
      # the original date so we can restore them into the params
      # after the search
      created_at_gt = params[:q][:created_at_gt]
      created_at_lt = params[:q][:created_at_lt]
      params[:q][:state_eq] ||= "complete"
      params[:q].delete(:inventory_units_shipment_id_null) if params[:q][:inventory_units_shipment_id_null] == "0"

      if !params[:q][:created_at_gt].blank?
        params[:q][:created_at_gt] = Time.zone.parse(params[:q][:created_at_gt]).beginning_of_day rescue ""
      end

      if !params[:q][:created_at_lt].blank?
        params[:q][:created_at_lt] = Time.zone.parse(params[:q][:created_at_lt]).end_of_day rescue ""
      end

      if @show_only_completed
        params[:q][:completed_at_gt] = params[:q].delete(:created_at_gt)
        params[:q][:completed_at_lt] = params[:q].delete(:created_at_lt)
      end

      #params[:q][:approver_id_null] ||= '1'



      params[:q][:bill_address_phone_cont] = params[:q][:bill_address_phone_cont].gsub(/[- ]/, "") if params[:q][:bill_address_phone_cont].present?
      if(params[:q][:payment_state_eq] == "paid")
        @show_only_paid = true
        params[:q][:payments_updated_at_gt] = params[:q].delete(:completed_at_gt)
        params[:q][:payments_updated_at_lt] = params[:q].delete(:completed_at_lt)
        #params[:q][:updated_at_gt] = params[:q].delete(:completed_at_gt)
        #params[:q][:updated_at_lt] = params[:q].delete(:completed_at_lt)
      end

      shipment_state_eq = params[:q][:shipment_state_eq]
      if(params[:q][:shipment_state_eq] == "backorder" || params[:q][:shipment_state_eq] == "pending")
        shipment_state_eq = "pending"
        params[:q].delete(:shipment_state_eq)
      end
      @search = Order.accessible_by(current_ability, :index).ransack(params[:q])

      #@total = @search.result(distinct: true).sum(:total)
      params[:per_page] ||= 20
      # if(shipment_state_eq == "pending")
      #   #@search.build_grouping({:m => 'or', :shipment_state_eq => "backorder", :shipment_state_eq => "pending"})
      # end
      # lazyoading other models here (via includes) may result in an invalid query
      # e.g. SELECT  DISTINCT DISTINCT "spree_orders".id, "spree_orders"."created_at" AS alias_0 FROM "spree_orders"
      # see https://github.com/spree/spree/pull/3919

      @orders = @search.result(distinct: true).
        page(params[:page]).
        per(params[:per_page] || Spree::Config[:orders_per_page])
      @orders = @orders.includes(:notes).where("shipment_state = ? OR shipment_state = ?", "backorder", "pending") if shipment_state_eq == "pending"
      @total = @orders.sum(:total)
      # Restore dates
      params[:q][:created_at_gt] = created_at_gt
      params[:q][:created_at_lt] = created_at_lt
      @search.shipment_state_eq = params[:q][:shipment_state_eq] = shipment_state_eq

      respond_to do |format|
        format.html
        format.js
        format.json { render :json => @orders }
      end
    end

    def new
      @order = Order.create(order_params)
      if params[:user_id].present?
        @order.update(user_id: params[:user_id])
      elsif params[:lead].present?
        @order.update(lead_id: params[:lead])
      end
      @order.use_billing = true
      @order.shipment_state = "pending"
      @order.email = spree_current_user.present? ? spree_current_user.email : "testmely@donghox.com"
      params["order"]["bill_address_attributes"]["phone"].delete(' ') if params["order"]["bill_address_attributes"]["phone"].present?
      params["order"]["bill_address_attributes"]["lastname"] ||= "AB"
      params["order"]["bill_address_attributes"]["city"] ||= ""
      params["order"]["bill_address_attributes"]["country_id"] ||= "84"
      params["order"]["bill_address_attributes"]["zipcode"] ||= "70000"
      params["order"]["bill_address_attributes"]["email"] = ""
      params["order"]["bill_address_attributes"]["state_id"] ||= ""
      params["order"]["bill_address_attributes"]["address1"] ||= ""
      params["order"]["bill_address_attributes"]["district_id"] ||= ""
      if(params["order"]["bill_address_attributes"].present?)
        params["order"]["bill_address_attributes"]["ip"] = request.remote_ip
        @first_order = get_first_order_from_phone(params["order"]["bill_address_attributes"]["phone"])
        @order.approver_id = @first_order.approver_id if @first_order.present? && @first_order.approver_id.present?
        @order.calculate_score
      end
      @order.device = device_name
      @order.update_from_params(params, permitted_checkout_attributes, request.headers.env)
      redirect_to edit_admin_order_path(@order)
    end
    

    def edit
      #allow_ips = Spree::Config[:accessible_ips].split(",")
      #check_ip = allow_ips.include?(@order.last_ip_address) ? "" : " OR last_ip_address = '#{@order.last_ip_address}'"
      @orders = Order.complete.joins(:ship_address).where("(spree_addresses.phone = ?) AND spree_orders.id <> ? ", @order.ship_address.phone, @order.id).order("spree_orders.created_at desc") if @order.ship_address.present?
      if @order.ship_address.blank? && @order.bill_address.blank?
        @order.ship_address = @order.bill_address = @order.build_ship_address
      elsif @order.bill_address.present?
        @order.update(ship_address: @order.bill_address)
      end
      # auto assign this order to current user if it's not assigned and this is a sale person
      @order.update_column(:approver_id, try_spree_current_user.id) if !@order.approver.present? && spree_current_user.has_spree_role?('sales_rep')
      unless @order.completed?
        @order.refresh_shipment_rates
      end
      @sales = User.joins(:spree_roles).where("spree_roles.name=?", "sales_rep")
      @return_authorization = @order.return_authorizations.first
    end

    def approve

      if(@order.approver.present?)
        @order.approved_by(@order.approver)
      else
        @order.approved_by(try_spree_current_user)
      end

      @order.shipments.first.send("ready")
      @order.update_attribute("shipment_state", "ready")

      # Create notification
      Notification.create(user_id: @order.ref_id, message: 'Đơn hàng <strong>'+@order.number+'</strong> đã được xác nhận', targetable_type: 'Spree::Order', targetable_id: @order.id)

      flash[:success] = Spree.t(:order_approved)
      redirect_to :back
    end

    def cancel
      @order.cancel!
      # Create notification
      Notification.create(user_id: @order.ref_id, message: 'Đơn hàng <strong>'+@order.number+'</strong> đã bị hủy', targetable_type: 'Spree::Order', targetable_id: @order.id)
      flash[:success] = Spree.t(:order_canceled)
      redirect_to :back
    end

    def resume
      @order.resume!

      # Create notification
      Notification.create(user_id: @order.ref_id, message: 'Đơn hàng <strong>'+@order.number+'</strong> đã được tiếp tục', targetable_type: 'Spree::Order', targetable_id: @order.id)
      @order.shipment_state = "ready"
      @order.save
      flash[:success] = Spree.t(:order_resumed)
      redirect_to :back
    end

    def open_adjustments
      adjustments = @order.all_adjustments.where(:state => 'closed')
      adjustments.update_all(:state => 'open')
      flash[:success] = Spree.t(:all_adjustments_opened)

      respond_with(@order) { |format| format.html { redirect_to :back } }
    end

    # Sale person can transfer an order to another sale
    # The other sale person need to accept the order so that the transfer is successful
    def transfer
      authorized_sale = Spree::User.find(params[:order][:authorized_approver_id])
      if spree_current_user.has_spree_role?('admin')
        # If admin doing the transfer then transfer directly
        @order.update_attribute(:approver_id, authorized_sale.id)
      else
        @order = Spree::Order.find_by_number(params[:id])
        @order.update_attribute(:authorized_approver_id, authorized_sale.id) if authorized_sale.present?
      end


      flash[:success] = Spree.t(:order_transfered)
      redirect_to :back
    end

    # Accept order transfer from other sale person
    def accept_transfer
      @order = Spree::Order.find_by_number(params[:id])
      @order.update_attributes({:approver_id => @order.authorized_approver_id, :authorized_approver_id => nil}) if @order.authorized_approver_id.present?
      flash[:success] = Spree.t(:order_accepted)
      redirect_to :back
    end
    protected

      def orders
        return @orders if @orders.present?
        @search = Order.ransack(params[:q])  
        params[:q] ||= {}
        params[:q][:s] ||= "created_at desc"
        if request.xhr? && params[:q].present? && false
          @orders = Order.includes(:user,:product)
                            .where("spree_users.email #{LIKE} :search",
                                  { :search => "#{params[:q].strip}%" })
                            .limit(params[:limit] || 100)
        else
          
          # @search = Spree::Lead.ransack(name_or_phone_cont: params[:search])
          @orders = @search.result.page(params[:page]).per(Spree::Config[:admin_products_per_page])
        end
      end

    private
    
      def device_name
        if browser.tablet?
          "Tablet"
        elsif browser.mobile?
          "Phone"
        else
          "Desktop"
        end
      end

      def get_first_order_from_phone(phone)
        phone = phone.gsub(/[- .]/, "")
        Order.complete.where(" state <> 'canceled' ").joins(:ship_address).where("spree_addresses.phone = ?", phone).first
      end

      def order_params
        params.require(:order).permit(
          :id, :user_id,
          :use_billing,
          :bill_address_attributes => permitted_address_attributes,
          :ship_address_attributes => permitted_address_attributes,
        )
      end
      
  end
end
