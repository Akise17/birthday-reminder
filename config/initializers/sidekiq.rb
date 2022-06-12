require 'sidekiq/web'
Sidekiq::Web.app_url = ENV['SERVER_URL']

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end
