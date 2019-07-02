Spree::UsersController.class_eval do
  before_action :authenticate_spree_user!
  def index
    @users = Spree::User.where('email LIKE?', '%'+params[:email]+'%')
    respond_to do |format|
      format.html
      format.json{
        render :json => @users.to_json
      }
      format.text
    end
  end

  def show
    @the_user = Spree::User.find(params[:id]) if params[:id].present?
    @user = @the_user if @the_user.present?
    @referred_orders = @user.referred_orders.complete.order("id DESC")
    @referred_products = Spree::Product.joins(:line_items).order("count DESC").where("spree_line_items.order_id" => @referred_orders).group("spree_products.id").select("sum(quantity) as count, spree_products.id, name, spree_products.deleted_at")
    @campaigns = @user.campaigns
    @taxonomies = current_store.taxonomies.includes(root: :children)

    @notifications = Notification.of_user(@user).order("id DESC").page(params[:page]).per(15)
  end

  def campaigns
    #authorize! :campaigns
    if spree_current_user.present?
      @the_user = spree_current_user
      @user = @the_user if @the_user.present?
      @referred_orders = @user.referred_orders.complete.order("id DESC")
      @referred_products = Spree::Product.joins(:line_items).order("count DESC").where("spree_line_items.order_id" => @referred_orders).group("spree_products.id").select("sum(quantity) as count, spree_products.id, name, spree_products.deleted_at")
      @campaigns = @user.campaigns
      @taxonomies = current_store.taxonomies.includes(root: :children)
    end
  end

  def referred_orders
    # authorize! :referred_orders, Spree.user_class
    if spree_current_user.present?

    @the_user = spree_current_user
    @user = @the_user if @the_user.present?
    @referred_orders = @user.referred_orders.complete.order("id DESC")
    if( params[:start_date].present? && params[:end_date].present? )
      @referred_orders = @referred_orders.where({created_at: (params[:start_date]).to_date.beginning_of_day..params[:end_date].to_date.end_of_day })
    end


    if (params[:camp_id].present?)
      @referred_orders = @referred_orders.where({campaign_id: params[:camp_id]})
    end

    @status = []
    if (params[:status].present?)
      if params[:status].include?("1")
        @status = ["pending","backorder"]
        @referred_orders = @referred_orders.where({shipment_state: @status})
      end
      if params[:status].include?("2")
        @status = ["ready"]
        @referred_orders = @referred_orders.where({shipment_state: @status})
      end
      if params[:status].include?("3")
        @status = ["shipped"]
        @referred_orders = @referred_orders.where({shipment_state: @status})
      end
      if params[:status].include?("4")
        @status = ["shipped_successfully"]
        @referred_orders = @referred_orders.where({shipment_state: @status})
      end
      if params[:status].include?("5")
        @status = ["returned","awaiting_return"]
        @referred_orders = @referred_orders.where({state: @status})
      end
      if params[:status].include?("6")
        @status = ["canceled"]
        @referred_orders = @referred_orders.where({state: @status})
      end
    end

    @referred_orders_not_canceled = @referred_orders.where.not({state: 'canceled'})

    @referred_products = Spree::Product.joins(:line_items).order("count DESC").where("spree_line_items.order_id" => @referred_orders_not_canceled).group("spree_products.id").select("sum(quantity) as count, spree_products.id, name, spree_products.deleted_at")

    @campaigns = @user.campaigns

    end
    @taxonomies = current_store.taxonomies.includes(root: :children)
  end

  def withdraw_money
    # authorize! :withdraw_money, Spree.user_class
    if spree_current_user.present?
      @the_user = spree_current_user
      @user = @the_user if @the_user.present?
      @referred_orders = @user.referred_orders.complete.order("id DESC")
      @referred_products = Spree::Product.joins(:line_items).order("count DESC").where("spree_line_items.order_id" => @referred_orders).group("spree_products.id").select("sum(quantity) as count, spree_products.id, name, spree_products.deleted_at")
    end
  end

  def send_withdraw_money
    if spree_current_user.present?
      @the_user = spree_current_user
      @user = @the_user if @the_user.present?

      amount = params[:amount]
      reason = params[:reason]
      from = @user.email
      # to = "webmely@gmail.com"
      to = "nghiahoang.webdesign@gmail.com" # mail test
      subject = "[#{current_store.name}] Yêu cầu thanh toán hoa hồng - #{@user.display_name}"
      content = "#{@user.display_name} yêu cầu thanh toán số tiền #{amount}. #{reason}"
      content_HTML = "#{@user.display_name} yêu cầu thanh toán số tiền #{amount}<br/>Lý do: #{reason}"

      if (amount.present? && reason.present?)
        result = SendGridMailer.send(subject, from, to, content, content_HTML)
        if (result == 1)
          redirect_to withdraw_money_success_path
        end
      end
      #redirect_to :back
    end
  end

  def success
  end

  def update
    if @user.update_attributes(user_params)
      if params[:user][:password].present?
        # this logic needed b/c devise wants to log us out after password changes
        user = Spree::User.reset_password_by_token(params[:user])
        sign_in(@user, :event => :authentication, :bypass => !Spree::Auth::Config[:signout_after_password_change])
      end

      if cookies[:update_phone]
        if @user.phone.blank?
          flash[:error] = Spree.t(:update_phone)
          redirect_to spree.account_url
        else
          cookies.delete :update_phone
          redirect_to "/my-albums"
        end
      else
        redirect_to spree.account_url, :notice => Spree.t(:account_updated)
      end
    else
      render :edit
    end
  end

  def albums
    if spree_current_user.present?
      if spree_current_user.phone.present?
        @albums = spree_current_user.albums
        if cookies[:album_url_share].present?
          @album_url_share = cookies[:album_url_share]
          cookies.delete :album_url_share
        end
      else
        flash[:error] = Spree.t(:update_phone)
        cookies[:update_phone] = true
        redirect_to "/account"
      end
    else
      redirect_to "/login"
    end
  end

  def update_phone
    phone = params[:phone]
    if valid(phone)
      spree_current_user.update_attribute(:phone, phone) if spree_current_user.present?
      render :json => { result: "valid" }
    else
      render :json => { result: "invalid" }
    end
  end

  def about_albums_competition
    redirect_to "/login" if spree_current_user.blank?
  end

  private
  def user_params
    params.require(:user).permit(Spree::PermittedAttributes.user_attributes + [:phone])
  end

  def valid(phone)
    p = phone.gsub(",", "").gsub(".", "").gsub(" ", "").gsub("-", "")
    length = p.length
    if p[0].to_i.to_s == p[0] && p[1..length-1].to_i.to_s == p[1..length-1] &&  length >= 10 && ((p[1] == "9" && length == 10) || p[1] == "1" && length == 11)
      true
    else
      false
    end
  end

end
