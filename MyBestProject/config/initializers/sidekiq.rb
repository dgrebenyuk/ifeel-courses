Sidekiq.configure_server do |config|
  config.redis = { url: "#{ ENV["REDIS_URL"] }/#{ ENV["REDIS_DB_NUM"] }" , password: ENV["REDIS_PASSWORD"] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "#{ ENV["REDIS_URL"] }/#{ ENV["REDIS_DB_NUM"] }" , password: ENV["REDIS_PASSWORD"] }
end
