# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Authentication::Application.default_url_options = Authentication::Application.config.action_mailer.default_url_options = {host: 'localhost', port: '3000'}