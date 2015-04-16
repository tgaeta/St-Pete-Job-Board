# == Schema Information
#
# Table name: job_applications
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  email        :string
#  resume       :string
#  cover_letter :text
#  phone        :string
#  link         :string
#  job_post_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class JobApplication < ActiveRecord::Base
  belongs_to :job_post
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :resume, presence: true
  validates :email, presence: true
  mount_uploader :resume, ResumeUploader
end
