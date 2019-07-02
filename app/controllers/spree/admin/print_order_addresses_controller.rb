module Spree
	module Admin
    class PrintOrderAddressesController < Spree::BaseController
    	layout "/spree/layouts/blank"
    	def index
      	@orders = Order.find(params[:ids].split(","))
    	end
    end
  end
end