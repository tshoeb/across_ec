# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
AcrossEc::Application.initialize!

config.action_mailer.delivery_method = :smtp
  
 config.action_mailer.default_url_options = { :host => "across-ec.herokuapp.com" }

 config.action_mailer.smtp_settings = {
	:enable_starttls_auto => true,
    :address => "smtp.gmail.com",
    :port => 587,
    :authentication => 'plain',
    :user_name => 'across.ec',
    :password => 'across_ec123'
  }