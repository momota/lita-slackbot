Lita.configure do |config|
  config.robot.name      = "lita"
  config.robot.log_level = :info
  config.robot.adapter   = :slack

  # slack
  config.adapters.slack.token = ENV["SLACK_API_KEY"]

  # redis
  config.redis[:url] = ENV["REDISTOGO_URL"]
  config.http.port   = ENV["PORT"]
end
