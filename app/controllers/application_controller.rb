class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user
  def current_user
    @current_user ||= Company.find_by(id: session[:user_id])
  end

  def signed_in?
    return true if current_user.present?
  end

  helper_method :signed_in?, :current_user

end
