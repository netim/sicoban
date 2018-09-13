require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sicoban
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Montevideo'

    # Faz com que css do ActiveAdmin não interfiram no Bootstrap
    # Fonte: https://stackoverflow.com/questions/10180418/rails-active-admin-css-conflicting-with-twitter-bootstrap-css
    config.assets.precompile += ['active_admin.css']
  end
end
