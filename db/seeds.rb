JobApplication.destroy_all
JobPost.destroy_all
Company.destroy_all

# puts 'Creating companies and job posts...'

# 10.times do |x|
#   puts "Creating company #{x}"
#   Company.create!(remote_logo_url: Faker::Company.logo,
#                   name: Faker::Company.name + Faker::Company.suffix,
#                   email: Faker::Internet.email,
#                   url: Faker::Internet.url,
#                   bio: Faker::Lorem.paragraph(2),
#                   password: 'password',
#                   password_confirmation: 'password',
#                   admin: false)
# end

# Company.create!(logo: Faker::Company.logo,
#                 name: Faker::Company.name + Faker::Company.suffix,
#                 email: 'test@gmail.com',
#                 url: Faker::Internet.url,
#                 bio: Faker::Lorem.paragraph(2),
#                 password: 'password',
#                 password_confirmation: 'password',
#                 admin: true)

# puts 'Creating job post for each company...'

# Company.all.each do |company|
#   11.times do |x|
#     tags = ['admin/office', 'business', 'customer service', 'education',
#             'engineering', 'finance', 'food/bevarage', 'general labor',
#             'government', 'healthcare', 'hospitality', 'human resources',
#             'internet', 'engineering', 'legal', 'manufacturing', 'marketing',
#             'media', 'nonprofit', 'real estate', 'retail/wholesale', 'sales',
#             'salon/spa/fitness', 'science', 'security', 'skilled trades',
#             'software', 'systems/networking', 'tech support', 'transportation',
#             'tv/video/radio', 'web design/development', 'writing', 'other']
#     uid = Company.ids
#     puts "Creating job post #{x} for company #{company.name}"
#     JobPost.create!(company_id: uid.shuffle.sample,
#                     job_title: Faker::Name.title,
#                     job_description: Faker::Lorem.paragraph(4) +
#                                      Faker::Lorem.paragraph(3),
#                     job_tag: tags.shuffle.sample)
#   end
# end
