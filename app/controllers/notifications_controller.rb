class NotificationsController < ApplicationController
  # def index
  #   @notification = Notification.where(recipient: admin).unread
  # end

  def create
    Notification.new(safe_params)
    redirect_to :back
  end


  def update_notification
    # Notification.all.each { |d| d.update_attribute(:seen, true ) }
    # Notification.update_attributes(:seen => 0)
    @notifications = Notification.all
    @notifications.update_all(seen: true)
    # @notifications.each do |n|
    #   n.update_attributes(:active => false)
    # end
    redirect_to :back

  end

  def show
  end

  def mark_all
    @notifications = Notification.all
    @notifications.activities.where(read: false).update_all(read: true)
    @notifications.each do |n|
      n.update_attributes(:active => false)
    end
    redirect_to :back
  end

  def mask_as_read
    @notifications = Notification.unread
    render json: {success: true}
  end




  protected
  def safe_params
    params.require(:notification).permit(:message, :user_id, :active)
  end

end
