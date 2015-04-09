class WelcomeController < ApplicationController
  def index
    @companies = Company.all.includes(:job_post)
    if params[:search].present?
      @jobs = JobPost.where('lower(job_title) || lower(job_description) ||
                             lower(job_tag) LIKE ?',
                            "%#{params[:search].downcase.strip}%").order('created_at DESC')
              .page(params[:page]).per(10)
    else
      @jobs = JobPost.all.includes(:company).order('created_at DESC').page(params[:page]).per(10)
    end
  end
end
