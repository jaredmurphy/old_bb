# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Action Mailer Configuration
# Delivery method set per environment
ActionMailer::Base.smtp_settings = {
  :tls => true,
  :address => "smtp.gmail.com",
  :port => 465,
  :domain => Rails.application.secrets.email_domain,
  :authentication => :login,
  :user_name => Rails.application.secrets.email_username,
  :password => Rails.application.secrets.email_password
}
