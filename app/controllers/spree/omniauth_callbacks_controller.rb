class Spree::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Spree::Core::ControllerHelpers::Common
  include Spree::Core::ControllerHelpers::Order
  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::SSL

  def self.provides_callback_for(*providers)

    providers.each do |provider|
      class_eval <<-FUNCTION_DEFS, __FILE__, __LINE__ + 1
        ssl_allowed :#{provider}
        def #{provider}
          if request.env["omniauth.error"].present?
            flash[:error] = I18n.t("devise.omniauth_callbacks.failure", :kind => auth_hash['provider'], :reason => Spree.t(:user_was_not_valid))
            redirect_back_or_default(root_url)
            return
          end

          authentication = Spree::UserAuthentication.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])

          if authentication.present?
            flash[:notice] = t("devise.omniauth_callbacks.success", :kind => auth_hash['provider'])
            cookies[:just_sign] = true
            authentication.user.update_attribute(:fb_name, auth_hash['info']['name']) if authentication.user.fb_name != auth_hash['info']['name']
            sign_in_and_redirect :spree_user, authentication.user
          elsif spree_current_user
            spree_current_user.apply_omniauth(auth_hash)
            spree_current_user.fb_name = auth_hash['info']['name'] if spree_current_user.fb_name != auth_hash['info']['name']
            spree_current_user.save!
            flash[:notice] = t("devise.sessions.signed_in")
            redirect_back_or_default(account_url)
          else
            user = Spree::User.find_by_email(auth_hash['info']['email']) || Spree::User.find_by_fb_id(auth_hash['uid']) || Spree::User.new
            user.apply_omniauth(auth_hash)
            user.ref_id = cookies[:ref_id] if cookies[:ref_id]
            user.fb_id = auth_hash['uid'] if user.fb_id != auth_hash['uid']
            user.fb_name = auth_hash['info']['name'] if user.fb_name != auth_hash['info']['name']
            user.email = auth_hash['info']['email'] if user.email != auth_hash['info']['email']
            if user.save
              flash[:notice] = I18n.t("devise.omniauth_callbacks.success", :kind => auth_hash['provider'])
              cookies[:just_sign] = true
              sign_in_and_redirect :spree_user, user
            else
              session[:omniauth] = auth_hash.except('extra')
              flash[:notice] = Spree.t(:one_more_step, :kind => auth_hash['provider'].capitalize)
              redirect_to new_spree_user_registration_url
              return
            end
          end

          if current_order
            user = spree_current_user || authentication.user
            current_order.associate_user!(user)
            session[:guest_token] = nil
          end
        end
      FUNCTION_DEFS
    end
  end

  SpreeSocial::OAUTH_PROVIDERS.each do |provider|
    provides_callback_for provider[1].to_sym
  end

  def failure
    set_flash_message :alert, :failure, :kind => failed_strategy.name.to_s.humanize, :reason => failure_message
    redirect_to spree.login_path
  end

  def passthru
    render :file => "#{Rails.root}/public/404", :formats => [:html], :status => 404, :layout => false
  end

  def auth_hash
    request.env["omniauth.auth"]
  end
end
