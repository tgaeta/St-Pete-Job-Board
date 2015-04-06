class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    if signed_in?.blank?
      @company = Company.new
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        CompanyMailer.welcome_email(@company).deliver_later
        format.html { redirect_to @company, notice: 'Success! Please sign-in.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_company
    @company = Company.where(id: current_user).find_by(id: params[:id])
    redirect_to root_path if @company.blank?
  end

  # Never trust parameters from the scary internet(white-list).
  def company_params
    params.require(:company).permit(:name, :email, :password,
                                    :password_confirmation, :url, :logo, :bio)
  end
end
