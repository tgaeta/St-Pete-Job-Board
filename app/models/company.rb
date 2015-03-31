class Company < ActiveRecord::Base
  has_many :job_posts
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
end
