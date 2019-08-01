# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.0.beta3"
# Use Puma as the app server
gem "puma", "~> 3.11"
# Use SCSS for stylesheets
gem "sassc-rails"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0.2"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "administrate"
gem "bootsnap", ">= 1.4.1", require: false
gem "devise"
gem "devise_invitable"
gem "haml-rails"
gem "high_voltage"
gem "jquery-rails", "~> 4.3"
gem "pundit"

group :production do
  gem "pg"
end

group :development do
  gem "better_errors"
  gem "foreman"
  gem "guard-bundler"
  gem "guard-rails"
  gem "guard-rspec"
  gem "html2haml"
  gem "letter_opener"
  gem "rails-erd"
  gem "rails_layout"
  gem "rb-fchange", require: false
  gem "rb-fsevent", require: false
  gem "rb-inotify", require: false
  gem "spring-commands-rspec"
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-rails"
  gem "pry-rescue"
  gem "rspec-rails"
  gem "rubocop-github", require: false
  gem "rubocop-rspec",  require: false
  gem "sqlite3", "~> 1.3", ">= 1.3.6"
end
group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "database_cleaner"
  gem "launchy"
  gem "pundit-matchers", "~> 1.6.0"
  gem "rspec_junit_formatter", require: false
  gem "selenium-webdriver"
  gem "shoulda-callback-matchers"
  gem "shoulda-matchers"
end
