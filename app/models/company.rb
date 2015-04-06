# == Schema Information
#
# Table name: companies
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  url             :string
#  logo            :string
#  bio             :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean          default(FALSE)
#

class Company < ActiveRecord::Base
  has_many :job_posts, dependent: :destroy
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  mount_uploader :logo, LogoUploader
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Company.exists?(column => self[column])
  end
end
