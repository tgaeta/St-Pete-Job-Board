class JobPostsController < ApplicationController
  before_action :set_company
  before_action :set_job_post, only: [:show, :edit, :update, :destroy, :apply]
  before_action :set_job_applicant, only: [:show]

  def apply
    @job_application = @job_post.job_applications.new(job_application_params)
    # binding.pry
    if @job_application.save
      CompanyMailer.job_applicant(@company).deliver_later
      redirect_to [@company, @job_post], notice: 'Your application has been successfully submitted!'
    else
      render :show, notice: 'You suck.'
    end
  end

  def index
    @job_posts = @company.job_posts
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
        format.html { redirect_to [@company, @job_post], notice: 'Job post was successfully created.' }
        format.json { render :show, status: :created, location: [@company, @job_post] }
      else
        format.html { render :new }
        format.json { render json: @job_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_post.update(job_post_params)
        format.html { redirect_to [@company, @job_post], notice: 'Job post was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_post }
      else
        format.html { render :edit }
        format.json { render json: @job_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_post.destroy
    respond_to do |format|
      format.html { redirect_to [@company, @job_post], notice: 'Job post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_job_applicant
    @job_application = @job_post.job_applications.new
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job_post
    @job_post = JobPost.find(params[:id])
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
