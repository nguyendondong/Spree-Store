class DistrictsController < Spree::StoreController
	def index
		@state = Spree::State.find_by_id(params[:state_id])
	    @districts = @state.districts
	     respond_to do |format|
		    format.html
		    format.json{
		      render :json => @districts.to_json
		    }
		    format.text
		  end
	end
end