module ApplicationHelper
	def check_variant(product, current_currency)
		!!product.variants_and_option_values(current_currency).any? && product.variants_and_option_values(current_currency).count>1
	end

	def variant_name(variant)
		if variant_options(variant).present?
			"(#{variant_options(variant)})"
		end
	end

	def shipped_successfully(order)
		if order.state == "complete"
			order.shipment_state == "shipped_successfully"
		end
	end

	def order_status(order)
		if order.state == "complete"
			if (order.shipment_state == "pending" || order.shipment_state == "backorder")
				"Đặt hàng"
			elsif order.shipment_state == "ready"
				"Sẵn sàng"
			elsif order.shipment_state == "shipped"
				"Đang ship"
			elsif order.shipment_state == "shipped_successfully"
				"Ship thành công"
			end
		elsif (order.state == "returned" || order.state == "awaiting_return")
			"Trả về"
		elsif order.state == "canceled"
			"Hủy"
		end
	end

	def check_del(cam_id)
		# return true => can delete, false => can't delete
		@orders = Spree::Order.where({campaign_id: cam_id})
		@orders.each do |order|
			unless order.state == "canceled"
				return false
			end
		end
		return true
	end

	def current_store
		p "---------------------------"
		@domain_name = request.host
		@domain_name = @domain_name.at(4..-1) if @domain_name.at(0..3) == "www."
		@domain_name = Rails.application.config.domain if @domain_name == "localhost"
		Spree::Store.find_by_url @domain_name
	end

	def staff?
		spree_current_user.present? && (spree_current_user.has_spree_role?('sales_rep') || spree_current_user.has_spree_role?('admin'))
	end

	def product_full_path(product)
		request.protocol + @domain_name + product_path(product)
	end

	# return price string in current_currency
	def value_to_price(value)
		Spree::Money.new(value, { currency: current_currency }).to_s
	end

	def current_currency
		Spree::Config[:currency]
	end

end
