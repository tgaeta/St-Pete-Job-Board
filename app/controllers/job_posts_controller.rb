class JobPostsController < ApplicationController
  before_action :visitor_restricted, only: [:create, :new, :edit, :update,
                                            :destroy]
  before_action :set_company
  before_action :set_job_post, only: [:edit, :update, :destroy, :apply]
  before_action :set_job_applicant_authorization, only: [:show, :apply]
  before_action :require_authorization, only: [:new]

  def apply
    @job_application = @job_post.job_applications.new(job_application_params)
    if @job_application.save
      CompanyMailer.job_applicant(@job_application).deliver_later
      redirect_to [@company, @job_post], notice: 'Thank you for applying.'
    else
      render :show, notice: 'An error has occurred. Please try again.'
    end
  end

  def index
    redirect_to root_path
  end

  def show
    @job_posts = @company.job_posts
  end

  def new
    @job_post = @company.job_posts.new
  end

  def edit
  end

  def create
    @job_post = @company.job_posts.new(job_post_params)

    respond_to do |format|
      if @job_post.save
        format.html { redirect_to [@company, @job_post], notice: 'Success!' }
        format.json { render :show, status: :created, location: [@company, @job_post] }
      else
        format.html { render :new }
        format.json { render json: @job_post.errors, status: 'Fail.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_post.update(job_post_params)
        format.html { redirect_to [@company, @job_post], success: 'Congrats! Your job post has been successfully posted.' }
        format.json { render :show, status: :ok, location: @job_post }
      else
        format.html { render :edit }
        format.json { render json: @job_post.errors, status: 'Fail.' }
      end
    end
  end

  def destroy
    @job_post.destroy
    respond_to do |format|
      format.html { redirect_to [@company, @job_post], notice: 'Destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def visitor_restricted
    redirect_to root_path if signed_in?.blank?
  end

  def require_authorization
    redirect_to root_path if cookies[:auth_token] != @company.auth_token
  end

  def set_job_applicant_authorization
    @job_post = JobPost.find_by(id: params[:id])
    @job_application = @job_post.job_applications.new
  end

  def set_company
    if signed_in?
      @company = @current_user
    else
      @company = Company.find(params[:company_id])
    end
  end

  def set_job_post
    if signed_in?
      @job_post = JobPost.find_by(id: params[:id], company_id: @company.id)
      redirect_to root_path if @job_post.blank?
    else
      @job_post = JobPost.find(params[:id])
    end
  end

  def job_post_params
    params.require(:job_post).permit(:logo, :job_title, :job_description,
                                     :job_tag, :company_id)
  end

  def job_application_params
    params.require(:job_application).permit(:first_name, :last_name, :email,
                                            :resume, :link, :phone,
                                            :cover_letter)
  end
end
