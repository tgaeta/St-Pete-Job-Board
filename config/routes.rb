Rails.application.routes.draw do
  root 'welcome#index'
  get 'sitemap/index'
  get 'session/form'
  post 'session/sign_in'
  delete 'session/sign_out'

  resources :companies do
    resources :job_posts do
      post 'apply', on: :member
    end
  end
  resources :sitemap, only: [:index]
  resources :password_resets
  ActiveAdmin.routes(self)
end
