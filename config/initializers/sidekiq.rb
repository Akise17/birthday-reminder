require 'sidekiq/web'
Sidekiq::Web.app_url = ENV['SERVER_URL']

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/11' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/11' }
end
