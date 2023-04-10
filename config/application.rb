require_relative "boot"

require "rails/all"
require 'rqrcode'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QrGenerator
  class Application < Rails::Application
    config.action_mailer.default_url_options = { host: "3000-ashleylem-railspractice-z7xcnir57il.ws-us90.gitpod.io" }

    config.hosts << "3000-ashleylem-railspractice-z7xcnir57il.ws-us93.gitpod.io"

    config.hosts << "mysite-bud4.onrender.com"

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
