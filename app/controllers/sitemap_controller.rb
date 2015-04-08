class SitemapController < ApplicationController
  respond_to :xml
  def index
    @jobs = JobPost.all
  end
end
