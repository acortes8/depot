class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere

  routing Rails.application.credentials.dig(:smtp, :user_name) => :support
end
