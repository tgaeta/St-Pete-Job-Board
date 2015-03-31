class JobPostsController < ApplicationController
  before_action :set_company
  before_action :set_job_post, only: [:show, :edit, :update, :destroy]

  # GET /job_posts
  # GET /job_posts.json
  def index
    @job_posts = @company.job_posts
  end

  # GET /job_posts/1
  # GET /job_posts/1.json
  def show
  end

  # GET /job_posts/new
  def new
    @job_post = @company.job_posts.new
  end

  # GET /job_posts/1/edit
  def edit
  end

  # POST /job_posts
  # POST /job_posts.json
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

  # PATCH/PUT /job_posts/1
  # PATCH/PUT /job_posts/1.json
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

  # DELETE /job_posts/1
  # DELETE /job_posts/1.json
  def destroy
    @job_post.destroy
    respond_to do |format|
      format.html { redirect_to [@company, @job_post], notice: 'Job post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_job_post
      @job_post = JobPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_post_params
      params.require(:job_post).permit(:logo, :job_title, :job_description, :job_tag, :company_id)
    end
end
