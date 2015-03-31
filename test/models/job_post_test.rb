# == Schema Information
#
# Table name: job_posts
#
#  id              :integer          not null, primary key
#  logo            :string
#  job_title       :string
#  job_description :text
#  job_tag         :string
#  company_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class JobPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
