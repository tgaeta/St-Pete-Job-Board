class CompanyMailer < ApplicationMailer
  default from: 'welcome@stpete.io'

  def welcome_email(company)
    @company = company
    @url  = 'http://example.com/login'
    mail(to: @company.email, subject: 'Welcome to My Awesome Site')
  end
end
