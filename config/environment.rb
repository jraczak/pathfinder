# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Pathfinder::Application.initialize!

# Sendgrid configuration based on Sendgrid website documentation
ActionMailer::Base.smtp_settings = {
	:user_name => 'jraczak',
	:password => 'eqs722026',
	:domain => 'glacial-fjord-1755.herokuapp.com',
	:address => 'smtp.sendgrid.net',
	:port => 587,
	:authentication => :plain,
	:enable_starttls_auto => true
}