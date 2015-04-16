class CompanyMailer < ApplicationMailer
  default from: 'jobs@stpete.io'

  def welcome_email(company)
    @company = company
    @url = 'http://example.com/login'
    mail(to: @company.email, subject: 'Welcome to My Awesome Site')
  end

  def job_applicant(job_application)
    @company = job_application.job_post.company
    @job_application = job_application
    attachments[job_application.resume.url.split('/')[-1]] = open(job_application.resume.url).read
    mail(from: @job_application.email, to: @company.email, subject: "New Job Application to Review for #{ @job_application.job_post.job_title}")
  end

  def password_reset(company)
    @company = company
    mail(to: @company.email, subject: 'Password Reset')
  end
end
