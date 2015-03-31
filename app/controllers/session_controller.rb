class SessionController < ApplicationController
  def sign_in
    user = Company.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{current_user.name}!"
    else
      flash[:warning] = 'Unable to log you in with those credentials.'
    end
    redirect_to root_path
  end

  def sign_out
    # Remove the user id from the session
    session[:user_id] = nil
    flash[:notice] = "See you later!"
    redirect_to root_path
  end
end
