class SessionController < ApplicationController
  def sign_in
    company = Company.find_by(email: params[:email]).try(:authenticate,
                                                         params[:password])
    if company
      cookies.permanent[:auth_token] = company.auth_token
      if params[:remember_me]
        cookies.permanent[:auth_token] = company.auth_token
      else
        cookies[:auth_token] = company.auth_token
      end
      flash[:notice] = "Welcome back, #{current_user.name}!"
    else
      flash[:warning] = 'Unable to log you in with those credentials.'
    end
    redirect_to root_path
  end

  def sign_out
    # Remove the user id from the session
    cookies.delete(:auth_token)
    flash[:notice] = 'See you later!'
    redirect_to root_path
  end
end
