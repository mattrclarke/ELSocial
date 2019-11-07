source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"
gem "rails", "~> 6.0.0"
gem 'sorcery'
gem "httparty"
gem "mysql2", ">= 0.4.4"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5"
gem "webpacker", "~> 4.0"
gem "bootsnap", ">= 1.4.2", require: false
gem "font-awesome-rails"
gem "virtus"
gem 'carrierwave', '~> 2.0'

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem 'pry-rails'
  gem "faker"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 3.8"
  gem "factory_bot_rails"
  gem "capybara"
  gem "knapsack"
  gem "webdrivers"
  gem "spring-commands-rspec", group: :development
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
