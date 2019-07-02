module Spree
  module Admin
    module Orders
      CustomerDetailsController.class_eval do
        def update
          params["order"]["bill_address_attributes"]["phone"].delete(' ') if params["order"]["bill_address_attributes"]["phone"].present?
          @lead = Spree::Lead.find_by(phone: params[:order][:bill_address_attributes][:phone])
          if @lead.present?
            @order.lead_id = @lead.id
          else
            @lead = Spree::Lead.create(user_id: spree_current_user.id, phone: params[:order][:bill_address_attributes][:phone], name: params[:order][:bill_address_attributes][:firstname], state_id: params[:order][:bill_address_attributes][:state_id], district_id: params[:order][:bill_address_attributes][:district_id], )
            @order.update(lead_id: @lead.id )
          end
          products = @order.line_items.map{|l| l.variant.product } 
          @lead.products << products
          if @order.update(order_params)
            if params[:guest_checkout] == "false"
              @order.associate_user!(Spree.user_class.find(params[:user_id]), @order.email.blank?)
            else 
              @order ||= current_order
              if try_spree_current_user && @order
                @order.associate_user!(try_spree_current_user) if @order.user.blank? || @order.email.blank?
              end
            end
            while @order.next; end
            @order.refresh_shipment_rates
            flash[:success] = Spree.t('customer_details_updated')
            p "=============+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
           
            p @order
            redirect_to edit_admin_order_path(@order)
          else
            render :action => :edit
          end

        end

        private
          def order_params
            params.require(:order).permit(
              :email, :user_id,
              :use_billing,
              :bill_address_attributes => permitted_address_attributes,
              :ship_address_attributes => permitted_address_attributes,
            )
          end
      end
    end
  end
end