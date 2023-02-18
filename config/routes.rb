Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => :sidekiq
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users,
             path: 'api/v1/users',
             controllers: { sessions: 'api/v1/users/sessions',
                            registrations: 'api/v1/users/registrations' }
  resources :users
end
