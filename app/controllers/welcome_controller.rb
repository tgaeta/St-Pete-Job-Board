class WelcomeController < ApplicationController
  def index
    @companies = Company.all
    @jobs = JobPost.where('lower(job_title) || lower(job_description) || lower(job_tag) || upper(job_title) || upper(job_description) || upper(job_tag) LIKE ?', "%#{params[:search]}%")
    #.where("lower(name) = ?", name.downcase).first
  end
end
