module Spree
    ReviewsController.class_eval do
        def create
            p params 
            params[:review][:rating].sub!(/\s*[^0-9]*\z/, '') unless params[:review][:rating].blank?
        
            @review = Spree::Review.new(review_params)
            @review.product = @product
            @review.user = spree_current_user if spree_user_signed_in?
            @review.ip_address = request.remote_ip
            @review.locale = I18n.locale.to_s if Spree::Reviews::Config[:track_locale]
        
            authorize! :create, @review
            if @review.save
                respond_to do |format|
                  flash[:notice] = Spree.t(:review_successfully_submitted)
                  format.html { redirect_to spree.product_path(@product) }
                  format.js
                end
              
            else
              render :new
            end
          end
    end
end