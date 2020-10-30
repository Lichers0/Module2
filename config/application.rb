require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # config.time_zone = 'Ekaterinburg'
    # config.available_locales = [:en, :ru]
    # config.default_locale = :ru

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :ru

    #Load this catalog only (without subdir)
    config.autoload_paths << "#{Rails.root}/lib/clients"

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      html_tag
    }
  end
end
