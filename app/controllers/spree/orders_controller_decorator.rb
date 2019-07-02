module Spree
  OrdersController.class_eval do
  	# Adds a new item to the order (creating a new order if none already exists)
    def populate
      # Check if params[:quantity] meet min_order_value condition
      if(params[:quantity].to_i < current_store.min_order_unit_number)
        # Return error message
        flash[:error] = Spree.t(:min_order_unit_number_must_be_greater_than, value: current_store.min_order_unit_number)
        redirect_back_or_default(spree.root_path)
        return
      end
      populator = Spree::OrderPopulator.new(current_order(create_order_if_necessary: true), current_currency)
      @order = current_order(lock: true)
      if cookies[:ref_id] && @order.ref_id.blank?
        ref_id = cookies[:ref_id]
        attrs = {:ref_id => ref_id, :campaign_id => cookies[:camp_id]}

        ref_user = User.find(ref_id)
        if ref_user.respond_to?(:has_spree_role?) && ref_user.has_spree_role?('sales_rep')
          # sale user refered this order so assign to him/her
          attrs[:approver_id] = ref_id
        end
        @order.update_attributes(attrs)
      end
      if populator.populate(params[:variant_id], params[:quantity])
        respond_with(@order) do |format|
          @order.next if @order.cart?
          #format.html { redirect_to checkout_state_path(@order.checkout_steps.first) }
          format.html { redirect_to cart_path() }
          format.json do
            render :json => { order: @order.as_json(:include => { :line_items => { :include => {:variant => { :include => [:volume_prices, :images, :product =>{only: [:name, :slug]}  ] }   } } }),
            state: Spree::State.all
            }
          end
        end
      else
        flash[:error] = populator.errors.full_messages.join(" ")
        redirect_back_or_default(spree.root_path)
      end
    end


    def show
      if params[:token].present?
        @token = true
      end
      @order = Order.find_by_number!(params[:id])
    end
  end
end
