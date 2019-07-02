module Spree
    module Admin  
      class NotificationsController < Spree::Admin::BaseController
        skip_before_filter :authorize_admin
        def index
          authorize! :manage, Notification
          @notifications = Notification.all.order("notifications.updated_at desc").page(params[:page]).per(5)
        end
        
      end
    end
  end