class SessionController < ApplicationController
  def sign_in
    company = Company.find_by(email: params[:email]).try(:authenticate,
                                                         params[:password])
    if company
      session[:company_id] = company.id
      flash[:notice] = "Welcome back, #{current_user.name}!"
    else
      flash[:warning] = 'Unable to log you in with those credentials.'
    end
    redirect_to root_path
  end

  def sign_out
    # Remove the user id from the session
    session[:company_id] = nil
    flash[:notice] = 'See you later!'
    redirect_to root_path
  end
end
