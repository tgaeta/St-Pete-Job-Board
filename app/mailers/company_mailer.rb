class CompanyMailer < ApplicationMailer
  default from: 'jobs@stpete.io'

  def welcome_email(company)
    @company = company
    @url = 'http://example.com/login'
    mail(to: @company.email, subject: 'Welcome to My Awesome Site')
  end

  def job_applicant(company)
    @company = company
    @url = 'http://example.com/resume_link'
    mail(to: @company.email, subject: "You have a new job application to review!")
  end
end
