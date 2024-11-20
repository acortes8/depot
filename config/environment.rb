# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 587,
    domain:               "depot.com",
    authentication:       "plain",
    user_name:            Rails.application.credentials.dig(:smtp, :user_name),
    password:             Rails.application.credentials.dig(:smtp, :password),
    enable_starttls_auto: true
  }
end
