module Spree
  CheckoutController.class_eval do
    layout :using_checkout_layout, only: [:edit, :update]
    skip_before_filter :verify_authenticity_token, only: [:update]
    def edit
      @disable_slider = true
      @districts = []
      @districts = @order.billing_address.state.districts if @order.billing_address.present? && @order.billing_address.state.present?
      if(@order.total < current_store.min_order_value)
        # Return error message
        @warning = Spree.t(:min_order_value_must_be_greater_than, value: current_store.min_order_value)
      end
    end

    def update
      phone = params[:order][:bill_address_attributes].present? ? params[:order][:bill_address_attributes][:phone] : "0908482804"
  		@order.use_billing = true
      @order.shipment_state = "pending"
      @order.email = spree_current_user.present? ? spree_current_user.email : "testmely@donghox.com"
      @districts = []
      @order.shipping_method_id = Spree::ShippingMethod.first.id
      if params["order"]["source"] == "shop"
        @order.coupon_code = "FREESHIPX"
      end
      if(params["order"]["bill_address_attributes"].present?)
        params["order"]["bill_address_attributes"]["ip"] = request.remote_ip
        @first_order = get_first_order_from_phone(params["order"]["bill_address_attributes"]["phone"])

        @order.ref_id = cookies[:ref_id] if cookies[:ref_id].present?

        # Find out approver
        #@order.approver_id = @first_order.approver_id if @first_order.present? && @first_order.approver_id.present?
        if spree_current_user.present? && spree_current_user.respond_to?(:has_spree_role?) && spree_current_user.has_spree_role?('sales_rep')
          @order.approver_id = spree_current_user.id unless @order.approver_id.present?
          @order.ref_id = nil
        end
          
        # If no approver yet, check for cookies
        if cookies[:ref_id].present?
          @order.campaign_id = cookies[:camp_id]
          if @order.approver_id.blank?
            ref_user = User.find(cookies[:ref_id])
            if ref_user.respond_to?(:has_spree_role?) && ref_user.has_spree_role?('sales_rep')
              # sale user refered this order so assign to him/her
              #@order.approver_id = @order.ref_id
            end
          end
        end

        #update attributes source
        @order.source = params["order"]["source"] if params["order"]["source"].present?
        @order.calculate_score
      end

      #update device name for order
      @order.device = device_name
      if @order.update_from_params(params, permitted_checkout_attributes, request.headers.env)
        @districts = @order.billing_address.state.districts if @order.billing_address.present? && @order.billing_address.state.present?
        if phone.present? && valid(phone)

          @order.temporary_address = !params[:save_user_address]
          unless @order.next
            flash[:error] = @order.errors.full_messages.join("\n")
            redirect_to checkout_state_path(@order.state) and return
          end

          if @order.completed?  
            # Create notification
            # Notification.auto_create(@order.ref_id, 'Có đơn đặt hàng mới, Mã hàng:  <strong>'+@order.number+'</strong>')
            Notification.create(user_id: @order.ref_id, message: "Có đơn đặt hàng mới, Mã hàng:  <strong> #{@order.number}</strong>", targetable_type: 'Spree::Order', targetable_id: @order.id )
            # @order.ship_address.delay.check_address(@order.last_ip_address)
            @current_order = nil
            flash.notice = Spree.t(:order_processed_successfully)
            flash['order_completed'] = true 
            @lead = Spree::Lead.find_or_create_by(phone: params[:order][:bill_address_attributes][:phone]) do |lead|
              lead.name = params[:order][:bill_address_attributes][:firstname]
              lead.district_id = params[:order][:bill_address_attributes][:district_id]
              lead.state_id = params[:order][:bill_address_attributes][:state_id]
            end
            @order.update(lead_id: @lead.id)
            # if @lead.present? 
            #   @order.lead_id = @lead.id 
            #   p "====TH1===="
            # else 
            #   @lead = Spree::Lead.create( phone: params[:order][:bill_address_attributes][:phone], name: params[:order][:bill_address_attributes][:firstname], state_id: params[:order][:bill_address_attributes][:state_id], district_id: params[:order][:bill_address_attributes][:district_id] )
            #   @order.update(lead_id: @lead.id )
            #   p "====TH2===="
            # end
            # create leads_products
            products = @order.line_items.map{|l| l.variant.product } 
            @lead.products << products
            respond_with() do |format|
              format.html { redirect_to completion_route}
              format.json { render :json => {:status => 'success', :order => @order }}
            end
          else
            redirect_to checkout_state_path(@order.state)
          end
        else
          flash.now[:error] = Spree.t(:invalid_phone_please_recheck)
          render :edit
        end
      else
        render :edit
      end
    end

    def valid(phone)
      p = phone.gsub(",", "").gsub(".", "").gsub(" ", "").gsub("-", "")
      length = p.length
      if ((length == 10) || p[1] == "1" && length == 11)
        true
      else
        false
      end
    end

    def get_first_order_from_phone(phone)
      phone = phone.gsub(/[- .]/, "")
      Order.complete.where(" state <> 'canceled' ").joins(:ship_address).where("spree_addresses.phone = ?", phone).first
    end

    private
    def using_checkout_layout
      if mobile_device?
        "spree/layouts/mobile"
      end
    end

    def device_name
      if browser.tablet?
        "Tablet"
      elsif browser.mobile?
        "Phone"
      else
        "Desktop"
      end
    end

  end
end
