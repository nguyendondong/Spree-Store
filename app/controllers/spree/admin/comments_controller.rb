module Spree
	module Admin
    class CommentsController < ResourceController
    	def index

    		respond_with(@collection) do |format|
          format.html
          format.json { render :json => json_data }
        end
    	end

    	protected

        def collection
          return @collection if @collection.present?
          params[:q] ||= {}
          @show_read = params[:read_eq] == '1'
          params[:q][:read_eq] = @show_read unless @show_read
          params[:q][:s] ||= "created_at desc"
          if request.xhr? && params[:q].present?
            @collection = Comment.includes(:user,:product)
                              .where("spree_users.email #{LIKE} :search",
                                    { :search => "#{params[:q].strip}%" })
                              .limit(params[:limit] || 100)
                              
          else
            @search = Comment.ransack(params[:q])
            @collection = @search.result.page(params[:page]).per(Spree::Config[:admin_products_per_page])
          end
        end
    end
  end
end