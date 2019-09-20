require "spec_helper"
require "capybara"
require "webdrivers/chromedriver"
require File.expand_path("../config/environment", __dir__)
require "support/test_helpers/login_helper"

ENV["RAILS_ENV"] ||= "test"
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Used for CI categorising
  config.after(:suite) { system("echo", "-e", '\n+++ Test Suite Summary') }

  if ENV["HEADLESS"]
    config.before(:each, type: :system, js: true) do
      driven_by :selenium, using: :chrome,
                           options: {
                             args: ["headless", "disable-gpu", "no-sandbox", "disable-dev-shm-usage"]
                           }
    end
  end

  config.before(:each, type: :system) do
    driven_by :selenium, using: :chrome
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.include Rails.application.routes.url_helpers
  config.include Capybara::DSL
  config.include FactoryBot::Syntax::Methods
  config.include Support::TestHelpers::LoginHelper
  config.filter_rails_from_backtrace!
  config.color = true
  config.formatter = ENV["SPEC_FORMATTER"] ? ENV["SPEC_FORMATTER"].to_sym : :progress
  config.example_status_persistence_file_path = "examples.txt"
end
