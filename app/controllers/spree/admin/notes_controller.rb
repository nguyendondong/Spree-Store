module Spree
	module Admin
    class NotesController < ResourceController
    	def index
    		respond_with(@collection) do |format|
          format.html
          format.json { render :json => json_data }
        end
    	end

      def create
        note_params = params.require(:note).permit(:content, :notable_id, :notable_type, :note_template_id)
        @note = spree_current_user.notes.create(note_params)
        if(note_params[:notable_type] == "Spree::Order")
          
        elsif (note_params[:notable_type] == "Spree::Lead")
          
        end
        respond_to do |format|
          format.html { render :text => "ok" }
          format.json { render :json => {result: "ok"} }
        end
        
      end

    	protected

        def collection
          return @collection if @collection.present?
          params[:q] ||= {}
          params[:q][:order_id_eq] ||= params[:order_id]
          if request.xhr? && params[:q].present?
            @collection = Note.includes(:user,:product)
                              .where("spree_users.email #{LIKE} :search",
                                    { :search => "#{params[:q].strip}%" })
                              .limit(params[:limit] || 100)
          else
            @search = Note.ransack(params[:q])
            @collection = @search.result.page(params[:page]).per(Spree::Config[:admin_products_per_page])
          end
        end
    end
  end
end