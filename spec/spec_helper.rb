# frozen_string_literal: true

require 'bundler/setup'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# necessary to test RAILS stuff:
#
ENV['RAILS_ENV'] ||= 'test'

require 'rails/railtie'
require 'action_controller/railtie'

module Config
  class Application < ::Rails::Application
    config.eager_load = false
  end
end

# Initialize the application
Config::Application.initialize!

# Sample locales files. We need to have some available locales. Setting of locale,
# by default, relies on having some available locales. And I actually want that
# because the functionality of the gem will rely on that.
I18n.load_path << "#{Config::Application.root}/spec/config/locales/en.yml"
I18n.load_path << "#{Config::Application.root}/spec/config/locales/el.yml"

require 'rspec/rails'

require 'rails_set_locale'
