class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SpreeMultiDomain::MultiDomainHelpers
  before_filter :get_ref_url
  before_filter :set_cookies
  before_filter :get_just_sign
  before_filter :get_slider_to_show
  before_filter :check_for_mobile
  # before_filter :layout_by_domain
  before_filter :load_domain, :template

  
  def get_ref_url
    if spree_current_user
      @ref_url = "http://donghox.com#{request.path}?ref_id=#{spree_current_user.id}"
      @appFBId = Spree::AuthenticationMethod.where(:environment => ::Rails.env, :active => true, :provider => "facebook").first.try(:api_key)
    end
  end

  def set_cookies
    cookies[:ref_id] = { :value => params[:ref_id], :expires => 30.days.from_now } if params[:ref_id]
    cookies[:camp_id] = {:value => params[:camp_id], :expires => 30.days.from_now } if params[:camp_id]
  end

  def get_just_sign
    if cookies[:just_sign]
      @just_sign = true
      cookies.delete :just_sign
    end
  end

  def get_slider_to_show
    @slider = Spree::Slider.first
    @disable_slider = false
  end

  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
    prepare_for_mobile if mobile_device?
  end

  def prepare_for_mobile
    prepend_view_path Rails.root + 'app' + 'views_mobile'
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      # Season this regexp to taste. I prefer to treat iPad as non-mobile.
      (request.user_agent =~ /Mobile|webOS/) #&& (request.user_agent !~ /iPad/)
    end
  end
  helper_method :mobile_device?

  def layout_by_domain
    load_domain
    prepend_view_path Rails.root + "app/views_domain/#{@domain_name}" if Dir.exists?("#{Rails.root}/app/views_domain/#{@domain_name}")
  end

  def template
    @template_name = current_store.template if current_store.present?
    prepend_view_path Rails.root + "app/views_template/#{@template_name}" if Dir.exists?("#{Rails.root}/app/views_template/#{@template_name}")
  end

  def current_store
    load_domain
    Rails.cache.fetch(@domain_name) do
      Spree::Store.find_by_url @domain_name
    end
  end

  def load_domain
    return @domain_name if @domain_name.present?
    @domain_name = request.host
    @domain_name = @domain_name.at(4..-1) if @domain_name.at(0..3) == "www."
    @domain_name = Rails.application.config.domain if @domain_name == "localhost"
  end

end
