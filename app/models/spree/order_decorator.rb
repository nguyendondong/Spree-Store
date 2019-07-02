module Spree
	Order.class_eval do
		# after_save :send_notification
		# include Spree::Order::Checkout
		has_many :notes, as: :notable
    belongs_to :lead
    belongs_to :campaign
    belongs_to :store
    delegate :name, to: :store, prefix: true, allow_nil: true

    delegate :name, to: :campaign, prefix: true, allow_nil: true

		# checkout_flow do
		# 	#remove_checkout_step :delivery
		# end
		remove_checkout_step :delivery
		remove_checkout_step :payment
		#before_update :fix_order_total

		Spree::Order.state_machine.before_transition :to => :complete, :do => :create_default_values
		#Spree::Order.state_machine.after_transition :to => :complete, :do => :fix_order_total

    belongs_to :referer, :class_name => "Spree::User", :foreign_key => :ref_id

		def shipment_state_new
			self.shipment_state.present? ? self.shipment_state : "pending"
		end
		def next_shipment_state
			if self.shipment_state_new == "pending"
				"ready"
			end
		end
		def next_payment_state
		end

	  def is_risky?
	    #BlackList.find_by_ip(self.last_ip_address).present?
	  end

		def create_default_values
			if self.shipments.blank?
				create_proposed_shipments
				shipments.first.update_amounts
				set_shipments_cost
				Spree::PromotionHandler::Coupon.new(self).apply if coupon_code.present?
				apply_free_shipping_promotions

				update_totals
				updater.persist_totals
			end
			default_payment_method = Spree::PaymentMethod.where(auto_capture: true).first
			self.payments.create(amount: self.total, payment_method_id: default_payment_method.id) if self.payments.blank?

		end

		# def fix_order_total
		# 	updater.update_order_total
		# end

		# Don't send email after user checkout
	  def deliver_order_confirmation_email
	    #OrderMailer.confirm_email(self.id).deliver
	    #update_column(:confirmation_delivered, true)
	  end

	  def send_cancel_email
      #OrderMailer.cancel_email(self.id).deliver
    end

	  def return_authorize
	  	return_authorization = return_authorizations.create({"amount"=>total, "reason"=>"", "stock_location_id"=>"1"})
			line_items.each do |item|
				return_authorization.add_variant(item.variant_id, item.quantity)
			end
    end

    def calculate_score
    end

    def shipped_shipments
      shipments.shipped + shipments.where(:state => "shipped_successfully")
		end

		# def send_notification
		# 	Pusher.trigger('my-channel', 'my-event', {
    #   message: 'hello world'
    # })
		# end

		def update_from_params(params, permitted_params, request_env = {})
			success = false
			p "Xuan Tai CheckOut Update"
			@updating_params = params
			run_callbacks :updating_from_params do
				# Set existing card after setting permitted parameters because
				# rails would slice parameters containg ruby objects, apparently
				existing_card_id = @updating_params[:order] ? @updating_params[:order].delete(:existing_card) : nil

				attributes = if @updating_params[:order]
											 @updating_params[:order].permit(permitted_params).delete_if { |_k, v| v.nil? }
										 else
											 {}
										 end
				if existing_card_id.present?
					credit_card = CreditCard.find existing_card_id
					if credit_card.user_id != user_id || credit_card.user_id.blank?
						raise Core::GatewayError, Spree.t(:invalid_credit_card)
					end

					credit_card.verification_value = params[:cvc_confirm] if params[:cvc_confirm].present?

					attributes[:payments_attributes].first[:source] = credit_card
					attributes[:payments_attributes].first[:payment_method_id] = credit_card.payment_method_id
					attributes[:payments_attributes].first.delete :source_attributes
				end

				if attributes[:payments_attributes]
					attributes[:payments_attributes].first[:request_env] = request_env
				end

				success = update(attributes)
				set_shipments_cost if shipments.any?
			end

			@updating_params = nil
			success
	end

	end
end