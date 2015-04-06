class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def authenticate_admin_user!
    redirect_to root_path unless current_user.try(:admin)
  end

  def current_user
    @current_user ||= Company.find_by(id: session[:company_id])
  end

  def signed_in?
    return true if current_user.present?
  end

  helper_method :signed_in?, :current_user
end
