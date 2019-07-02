class CampaignsController < ApplicationController
  before_action :set_campaign, only:[:show, :edit, :update, :destroy]

  def create
    spree_current_user.campaigns.create(campaign_parameters) if spree_current_user
    redirect_to :back
  end

  def update
    @campaign.update(campaign_parameters)
    redirect_to :back
  end

  def destroy
    # Xoa chien dich thi ca don hang se bi xoa theo
    if @campaign.destroy
      @orders = Spree::Order.where({campaign_id: @campaign.id})
      @orders.each do |order|

        # Create notification
        Notification.auto_create(orders.ref_id, 'Đơn hàng <strong>'+order.number+'</strong> đã bị xóa')

        order.destroy
      end
      redirect_to :back
    end
  end

  def update_status
    active = params[:active].to_i
    cam_id = params[:cam_id].to_i
    respond_to do |format|
      if Campaign.update(cam_id, :active => active)
        format.html
        format.json { render :json => {"status" => "success"}}
      else
        format.json { render :json => {"status" => "error" }}
      end
    end
  end

  def campaign_details
    active = params[:active].to_i
    cam_id = params[:cam_id].to_i
    respond_to do |format|
      if Campaign.update(cam_id, :active => active)
        format.html
        format.json { render :json => {"status" => "success"}}
      else
        format.json { render :json => {"status" => "error" }}
      end
    end
  end

	protected
	def campaign_parameters
    params.require(:campaign).permit(:name, :active, :description)
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def current_store
    Spree::Store.first
  end
end