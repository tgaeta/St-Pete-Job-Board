class PasswordResetsController < ApplicationController
  def create
    company = Company.find_by_email(params[:email])
    company.send_password_reset if company
    redirect_to root_path, notice: 'Email sent with password reset instructions.'
  end

  def edit
    @company = Company.find_by_password_reset_token!(params[:id])
  end

  def update
    @company = Company.find_by_password_reset_token!(params[:id])
    if @company.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: 'Password reset has expired.'
    elsif @company.update_attributes(company_params)
      redirect_to root_path, notice: 'Password has been reset!'
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:password, :password_confirmation)
  end
end
