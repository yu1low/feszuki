Yt.configure do |config|
  config.api_key = Rails.application.secrets.yt_key
  config.log_level = :debug
end