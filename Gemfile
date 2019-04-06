# frozen_string_literal: true

ruby File.read('.ruby-version').strip

# rubocop:disable Metrics/BlockLength
source 'https://rubygems.org' do
  platforms :rbx do
    gem 'psych'
    gem 'racc'
    gem 'rubysl'
    gem 'rubysl-test-unit', require: false
  end

  rails_version = '~> 5.2.3'
  gem 'actionpack', rails_version
  gem 'actionview', rails_version
  gem 'activerecord', rails_version
  gem 'activesupport', rails_version

  gem 'sprockets-rails'

  gem 'rails-i18n'

  gem 'tzinfo-data'

  # DB
  gem 'pg', '~> 0.18.1'

  # View
  gem 'redcarpet', '~> 3.4.0'
  gem 'representable', '~> 3.0.4'
  gem 'responders', '~> 2.4.1'
  gem 'simple-navigation', '~> 4.0'
  gem 'slim', '~> 4.0.1'

  # Image
  gem 'carrierwave', '~> 1.2.2'
  gem 'cloudinary', '~> 1.1.7'

  # Validation
  gem 'date_validator', '~> 0.9'

  # Assets
  gem 'coffee-rails', '~> 4.2.0'
  gem 'sass-rails', '~> 5.0.0'
  gem 'uglifier', '>= 1.3.0'

  gem 'bootstrap-sass', '~> 3.1.0'
  gem 'jquery-rails'

  # Server
  gem 'puma', '~> 3.4'

  # Config
  gem 'dotenv-rails'

  # Error handling
  gem 'rollbar', '~> 2.11.3'

  group :test do
    gem 'factory_bot_rails'
    gem 'ffaker'
    gem 'guard-rspec'
    gem 'guard-rubocop'
    gem 'rspec-its'
    gem 'rspec-rails', '~> 3.8.1'
    gem 'shoulda-matchers', '~> 3.1.2', require: false
    gem 'timecop'
  end

  group :development do
    gem 'brakeman', require: false
    gem 'flog', require: false
    gem 'i18n-tasks'
    gem 'pry-rails', require: false
    gem 'rubocop', '~> 0.67.0', require: false
    gem 'rubocop-performance', '~> 1.0', require: false
    gem 'rubocop-rspec', '~> 1.32.0', require: false
  end

  group :test, :development do
    gem 'pry-byebug'
    gem 'sqlite3', '~> 1.3.6'
  end

  group :production do
    gem 'rails_12factor'
  end
end
# rubocop:enable Metrics/BlockLength

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap-markdown', '~> 2.5'
  gem 'rails-assets-marked', '~> 0.3.2'
  gem 'rails-assets-vis', '~> 3.12'
end
