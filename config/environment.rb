# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Action Mailer Configuration
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :tls => true,
  :address => "smtp.gmail.com",
  :port => 465,
  :domain => ENV["EMAIL_DOMAIN"],
  :authentication => :login,
  :user_name => ENV["EMAIL_USERNAME"],
  :password => ENV["EMAIL_PASSWORD"]
}
