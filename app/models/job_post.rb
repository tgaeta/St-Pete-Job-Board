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

class JobPost < ActiveRecord::Base
  belongs_to :company
  validates :job_title, presence: true
  validates :job_description, presence: true, length: { minimum: 100 }
  validates :job_tag, presence: true
end
