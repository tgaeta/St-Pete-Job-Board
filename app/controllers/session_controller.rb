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
      flash[:success] = "Welcome back, #{current_user.name}!"
    else
      flash[:danger] = 'Unable to log you in with those credentials.'
    end
    redirect_to new_company_job_post_path(@current_user)
  end

  def sign_out
    # Remove the user id from the session
    cookies.delete(:auth_token)
    flash[:notice] = 'See you later!'
    redirect_to root_path
  end
end
