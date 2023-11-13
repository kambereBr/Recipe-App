# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
   :user_name => "ahmedsalah025566@gmail.com",
   :password => "wBD4ITP95XGQr6kE",
   :domain => "yourdomain.com",
   :address => "smtp-relay.sendinblue.com",
   :port => 587,
   :authentication => :plain,
   :enable_starttls_auto => true
 }
