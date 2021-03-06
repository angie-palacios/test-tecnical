require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestTecnical
  CREATE_USER = "create_user"
  EDIT_USER = "edit_user"
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded. 

    config.generators do |g|
      g.jbuilder false
      g.test_framework  nil
      g.assets  false
      g.helper false
      g.stylesheets false
    end

  end
end
