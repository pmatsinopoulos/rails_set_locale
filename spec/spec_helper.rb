# frozen_string_literal: true

require 'bundler/setup'
require 'rails_set_locale'

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

require 'action_controller/railtie'

module Config
  class Application < ::Rails::Application
  end
end

# Initialize the application
Config::Application.initialize!

require 'rspec/rails'
