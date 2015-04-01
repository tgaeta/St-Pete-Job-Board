ActiveAdmin.setup do |config|
  config.site_title = 'DemoDay'
  config.site_title_link = '/'
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_user
  config.logout_link_path = :root_path
  config.batch_actions = true
end
