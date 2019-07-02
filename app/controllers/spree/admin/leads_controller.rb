module Spree
	module Admin
    class LeadsController < ResourceController
      def index   
        params[:q] ||= {}
        @show_only_unprocessed = params[:show_only_unprocessed] == '1'
        if @show_only_unprocessed
          params[:q][:approver_id_null] = '1'
        end
        params[:q][:completed_at_not_null] ||= '1' if Spree::Config[:show_only_complete_orders_by_default]
        @show_only_completed = params[:q][:completed_at_not_null] == '1'
        params[:q][:approver_id_eq] ||= spree_current_user.id.to_s if @show_only_unprocessed && spree_current_user.has_spree_role?('sales_rep')
        @show_only_my_orders = params[:q][:approver_id_eq] == spree_current_user.id.to_s
        params[:q].delete(:approver_id_eq) if params[:q][:approver_id_eq] == '0'
        params[:q][:s] ||= @show_only_completed ? 'completed_at desc' : 'created_at desc'
                 
        @lead= Lead.new
    		respond_with(@collection) do |format|
          format.html
          format.js
          format.json { render :json => @collection }
        end
        
      end
      
      def create
        if params[:lead][:phone].present?
          @lead = Lead.new(lead_params)
          if @lead.fb_url.present?
            fb_name = @lead.fb_url.split('/').last
            @lead.fb_name = fb_name.gsub(".","")
          end
          user = User.find_by_phone(params[:lead][:phone])
          @lead.save
          if params[:variant_ids].present?
            products = Product.joins("RIGHT JOIN spree_variants  ON spree_products.id = spree_variants.product_id").where(:spree_variants => {id: params[:variant_ids]}).distinct(:id)
            @lead.products << products
          end
          if user.present?
            @lead.user_id = user.id
          end
          if params[:note].present?
            note = Note.create(content: params[:note], notable_id: @lead.id.to_s, notable_type: "Spree::Lead", lead_id: @lead.id)
          end
          @lead.save
          if params[:images].present?
            params[:images].each do |file|
              @lead.pictures.create(image: file)
            end
          end
          redirect_to admin_leads_path
        else
          flash.now[:error] = Spree.t("lead.product_email_cannot_be_blank")
          render :new
        end
      end

      def edit
        @lead = Lead.find(params[:id])
      end

      def update
        
        @lead.products.delete_all
        if params[:variant_ids].present?
          products = Product.joins("RIGHT JOIN spree_variants  ON spree_products.id = spree_variants.product_id").where(:spree_variants => {id: params[:variant_ids]}).distinct(:id)
          @lead.products << products
        end
        user = User.find_by_phone(params[:lead][:phone])
        @lead.user_id = user.id if user.present?
        @lead = Lead.find(params[:id])
        @lead.save
        @lead.update(lead_params)
        if params[:images].present?
        params[:images].each do |file|
          @lead.pictures.create(image: file)
        end
        end
        if params[:note].present?
          note = Note.create(content: params[:note], notable_id: @lead.id.to_s, notable_type: "Spree::Lead", lead_id: @lead.id)
        end
        redirect_to edit_admin_lead_path(@lead)	
      end

    	protected

      def collection
        return @collection if @collection.present?
        @search = Lead.ransack(params[:q])  
        params[:q] ||= {}
        params[:q][:s] ||= "created_at desc"
        if request.xhr? && params[:q].present? && false
          @collection = Lead.includes(:user,:product)
                            .where("spree_users.email #{LIKE} :search",
                                  { :search => "#{params[:q].strip}%" })
                            .limit(params[:limit] || 100)
        else
          
          # @search = Spree::Lead.ransack(name_or_phone_cont: params[:search])
          @collection = @search.result.page(params[:page]).per(Spree::Config[:admin_products_per_page])
        end
      end
      

      def lead_params
        params.require(:lead).permit(:name, :phone, :user_id, :fb_post_id, :fb_url, :state_id, :district_id, :major, :zalo, :lead_list_id,:website, :company,  pictures_attributes: [ :_destroy, :id, :image] )
      end

    end

  end
end