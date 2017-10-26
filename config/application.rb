require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PickMyDog
  class Application < Rails::Application
    
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.enabled = true
    config.assets.paths << Rails.root.join('/app/assets/fonts')
    # the above code is to link my file path assets to my font folder when calling my font in html.
  end
end
