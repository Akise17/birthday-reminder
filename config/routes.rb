Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount_devise_token_auth_for 'Admin', at: 'auth'
  require 'sidekiq/web'

  # mount Sidekiq::Web => :sidekiq
  mount Sidekiq::Monitor::Engine => '/sidekiq'

  namespace :v1 do
    resources :user
  end
end
