class WelcomeController < ApplicationController
  def index
    @companies = Company.all
    @jobs = JobPost.all
  end
end
