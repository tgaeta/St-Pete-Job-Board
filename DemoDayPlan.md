# App Idea: Job Board

## The Gist:
- [x] Companies can Sign Up
- [x] Companies can Post a Job
- [ ] Visitors can search for a job through tags or search bar
- [x] Visitors can Apply to Job


## User Stories
- [x] Visitors should be able to visit the home page - 2hrs
- [ ] Visitors should be able to search jobs via search bar and tags - 16hrs
- [x] Visitors should be able to sign up - 4hrs
- [x] Visitors should receive welcome e-mail - 4hrs
- [x] Visitors should be able to sign in - 1hr
- [x] Companies should be able to sign out - 1hr
- [x] Companies should be able to create a job post - 3 hrs
- [ ] Companies should be able to preview a job post - 3 hrs
- [ ] Companies should be able to pay for a job post and post it - 3 hrs
- [x] Companies should be able to edit their job post - 4hrs
- [x] Companies should be able to visit their posting
- [x] Admins should be able to visit the admin section - 2hrs
- [x] Admin should be able to CRUD job posts
- [x] Admin should be able to CRUD companies

## Tasks

### Visitors should be able to visit the home page
- [x] Setup Rails app
- [x] Configure my root route
- [x] Create my welcome controller and welcome/home page
- [x] Setup GitHub repo
- [x] Setup initial Heroku app and push it

### Create all models
- [x] Create Company
- [x] Create JobPost

### Visitors should be able to sign up
- [x] Create a Company model and migration
- [x] Create a session controller
- [x] Create a signup route and action
- [x] Create a signup form
- [x] Add validations to Company model
- [x] Add link on home page/nav to post job

### Company should be able to upload company logo to a job post
- [x] Install carrierwave gem
- [x] Create an uploader
- [x] Setup the initializer
- [x] Setup S3 security
- [x] Setup S3 bucket
- [x] Setup .env file (add to gitignore)
- [x] Install fog gem
- [x] Install minimagic gem


### Users should be able to browse jobs (paginated)
- [x] Create a JobPost model and migration
- [ ] Create seed file for fake jobs

## Technologies
- [x] S3
- [x] Carrierwave / Fog
- [x] Environment variables (.env, dotenv gem)
- [ ] Kaminari for pagination
- [x] bcrypt
- [ ] Search engine (make one like we did with pinterest app)
- [x] Active admin
- [x] Add SendGrid from Heroku
- [x] Visitors can Apply to Job


## Risks
- [x] Time Management - Ensuring functionality and moving on if I have fail to meet a deadline. I can always come back.
- [x] Javascript - Don't know a whole lot about it

## Data / Models
- [x] Company: name, email, password, logo, bio
- [x] JobPost: company_name, company_logo, job_title, job_body, job_tag

## Controllers
- [x] Welcome
- [x] Company
- [x] Job Posts
- [ ] Search
- [x] Session

##Things to Consider
###Heroku
- [x] Add Thin and Rails12Factor gems
- [x] Create procfile and add this `web: bundle exec thin start -p $PORT
`

###.env
- [x] Add dotenv-rails gem
- [x] Add .env to .gitignore folder
- [x] Add environmentals to Heroku

## Gems Needed
```ruby
gem 'pg'
gem 'thin'
gem 'carrierwave', '~> 0.10.0'
gem 'faker', '~> 1.4.3'
gem 'mini_magick'
gem 'fog'
gem 'kaminari'
gem 'activeadmin', github: 'activeadmin'
gem 'bourbon'
gem 'bcrypt'
gem 'bootstrap_form'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate', '~> 2.6.5'
  gem 'letter_opener'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'pry'
  gem 'minitest'
  gem 'minitest-reporters'
end

gem 'dotenv-rails', :groups => [:development, :test]

group :production do
  gem 'rails_12factor'
end
```
