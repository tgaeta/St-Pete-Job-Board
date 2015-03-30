# App Idea: Job Board

## The Gist:
- [ ] Companies can Sign Up
- [ ] Companies can Post a Job
- [ ] Visitors can search for a job through tags or search bar
- [ ] Visitors can Apply to Job


## User Stories
- [ ] Visitors should be able to visit the home page - 2hrs
- [ ] Visitors should be able to search jobs via search bar and tags - 16hrs
- [ ] Visitors should be able to sign up - 4hrs
- [ ] Visitors should receive welcome e-mail - 4hrs
- [ ] Visitors should be able to sign in - 1hr
- [ ] Companies should be able to sign out - 1hr
- [ ] Companies should be able to create a job post - 3 hrs
- [ ] Companies should be able to preview a job post - 3 hrs
- [ ] Companies should be able to pay for a job post and post it - 3 hrs
- [ ] Companies should be able to edit their job post - 4hrs
- [ ] Companies should be able to visit their posting
- [ ] Admins should be able to visit the admin section - 2hrs
- [ ] Admin should be able to CRUD job posts
- [ ] Admin should be able to CRUD companies

## Tasks

### Visitors should be able to visit the home page
- [ ] Setup Rails app
- [ ] Configure my root route
- [ ] Create my welcome controller and welcome/home page
- [ ] Setup GitHub repo
- [ ] Setup initial Heroku app and push it

### Create all models
- [ ] Create Company
- [ ] Create JobPost

### Visitors should be able to sign up
- [ ] Create a Company model and migration
- [ ] Create a session controller
- [ ] Create a signup route and action
- [ ] Create a signup form
- [ ] Create an action to create the user upon signup
- [ ] Add validations to Company model
- [ ] Add link on home page/nav to sign up

### Company should be able to upload company logo to a job post
- [ ] Install carrierwave gem
- [ ] Create an uploader
- [ ] Setup the initializer
- [ ] Setup S3 security
- [ ] Setup S3 bucket
- [ ] Setup .env file (add to gitignore)
- [ ] Install fog gem
- [ ] Install minimagic gem
- [ ] Modify the user form with a file field and cache field
- [ ] Adjust the controller params

### Users should be able to browse jobs (paginated)
- [ ] Create a JobPost model and migration
- [ ] Create seed file for fake jobs

## Technologies
- [ ] S3
- [ ] Carrierwave / Fog
- [ ] Environment variables (.env, dotenv gem)
- [ ] Kaminari for pagination
- [ ] bcrypt
- [ ] Search engine (make one like we did with pinterest app)
- [ ] Active admin
- [ ] Add SendGrid from Heroku
- [ ] Visitors can Apply to Job


## Risks
- [ ] Time Management - Ensuring functionality and moving on if I have fail to meet a deadline. I can always come back.
- [ ] Javascript - Don't know a whole lot about it

## Data / Models
- [ ] Company: name, email, password, logo, bio
- [ ] JobPost: company_name, company_logo, job_title, job_body, job_tag

## Controllers
- [ ] Welcome
- [ ] Company
- [ ] Job Posts
- [ ] Search
- [ ] Session

##Things to Consider
###Heroku
- [ ] Add Thin and Rails12Factor gems
- [ ] Create procfile and add this `web: bundle exec thin start -p $PORT
`

###.env
- [ ] Add dotenv-rails gem
- [ ] Add .env to .gitignore folder
- [ ] Add environmentals to Heroku

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
