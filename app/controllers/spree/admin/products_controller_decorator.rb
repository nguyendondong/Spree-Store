module Spree
  Admin::ProductsController.class_eval do
    after_filter :update_price_for_variant, only: [:update]


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
      # so luong tat ca san pham con lai trong kho 
      if ::Report.count > 0
         products_day=::Report.where(reports: {time_report:  Date.today.end_of_day , type_report: 0 ,state: "shipped_successfully"  }) 
        @sum_product = products_day.last.count_on_hand.present?  ? products_day.last.count_on_hand.values.sum : 0

        @remain_product = products_day.last.count_on_hand.present?  ? products_day.last.count_on_hand : 0 # so luong con lai cua tung product 
    
         #chart 
        def sale_report(value)
          @report_month = {}
           date_in_month=(value.ago(Date.today)..(Date.today)).to_a
           @array_value_none = Array.new(date_in_month.count,0)
            date_in_month.each_with_index do |d,index|
            order_available = ::Report.where(reports: {time_report:  d.end_of_day , type_report: 0 ,state: "shipped_successfully" } )
            if order_available.present? &&(!order_available.last.content.blank?)  
                content_report = order_available.last.content.last
                # if content_report.present?
                content_report.each do |rp|
                 id =rp.first
                 value = rp.last
                 if @report_month.has_key? id
                   b=@report_month[id]
                   b[index]= value
                   @report_month[id]=b             
                 else
                 b=Array.new(date_in_month.count,0)
                     b[index]= value
                   @report_month[id]=b          
                end 
                 end
               end
               end
              return @report_month
              # end
        end
      end
        def sold( sale_report )
          @sold_month= {}
            if @report_month.present?
           @report_month.each do |r|
             a=r.last.sum 
             b = r.first  
             @sold_month[b]=a
           end
          end 
          return @sold_month 
        end
      # 1 thang
       @report_1_month = sale_report(1.month)
        @sold_1_month = sold(@report_1_month)

     @sold_ids = @sold_1_month.sort {|a1,a2| a2[1].to_i <=> a1[1].to_i }.to_h.keys
    str_q = ""
    @sold_ids.each{ |k| str_q+= "spree_products.id = #{k} DESC," }
    str_q = str_q[0..-2]
     @collection = @search.result.page(params[:page]).order(str_q).per(Spree::Config[:admin_products_per_page])

      # # 3 thang   
      @report_3_month =  sale_report(3.month)
      @sold_3_month = sold(@report_3_month)
      
     
      respond_with(@collection) do |format|
        format.html
        format.js
        format.json { render :json => @collection }
      end
      

  
    end
  def update
    if params[:product][:taxon_ids].present?
      params[:product][:taxon_ids] = params[:product][:taxon_ids].split(',')
    end
    if params[:product][:option_type_ids].present?
      params[:product][:option_type_ids] = params[:product][:option_type_ids].split(',')
    end
    if  params['image'].present?
      params['image']['attachment'].each do |file|
        @product.images.create(attachment: file)
      end
    end
    invoke_callbacks(:update, :before)
    if @object.update_attributes(permitted_resource_params)
      invoke_callbacks(:update, :after)
      flash[:success] = flash_message_for(@object, :successfully_updated)
      respond_with(@object) do |format|
        format.html { redirect_to location_after_save }
        format.js   { render :layout => false }
      end
    else
      # Stops people submitting blank slugs, causing errors when they try to update the product again
      @product.slug = @product.slug_was if @product.slug.blank?
      invoke_callbacks(:update, :fails)
      respond_with(@object)
    end
  end

    def destroy
      @product = Product.friendly.find(params[:id])
      @product.update_attribute(:deleted_at, Time.zone.now)

      flash[:success] = Spree.t('notice_messages.product_deleted')

      respond_with(@product) do |format|
        format.html { redirect_to collection_url }
        format.js  { render_js_for_destroy }
      end
    end

    def recover
      @product = Product.unscoped.find(params[:id])
      @product.update_attribute(:deleted_at, nil)
      flash[:success] = Spree.t('notice_messages.product_recovered')

      respond_with(@product) do |format|
        format.html { redirect_to collection_url }
        format.js  { render_js_for_destroy }
      end
    end
    def collection
      return @collection if @collection.present?
      @search = Product.ransack(params[:q])  
      params[:q] ||= {}
      params[:q][:s] ||= "created_at desc"
      if request.xhr? && params[:q].present? && false
        @collection = Product.includes(:sku,:product)
                          .where("spree_products.name #{LIKE} :search" ,
                                { :search => "#{params[:q].strip}%" }) 
                          .limit(params[:limit] || 100)
      else
      
        # @search = Spree::Lead.ransack(name_or_phone_cont: params[:search])
        #  @collection = @search.result.page(params[:page]).per(Spree::Config[:admin_products_per_page])

      end
    end  
   

    private
    
    def update_price_for_variant
      @product.variants.each do |p|
        p.prices.update_all(amount: params[:product][:price])
      end
    end

  end
end