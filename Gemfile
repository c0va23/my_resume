ruby File.read('.ruby-version').strip

source 'https://rubygems.org' do
  platforms :rbx do
    gem 'rubysl'
    gem 'rubysl-test-unit', require: false
    gem 'racc'
    gem 'psych'
  end

  gem 'rails', '~> 5.0.7'

  gem 'rails-i18n'

  gem 'tzinfo-data'

  # DB
  gem 'pg', '~> 0.18.1'

  # View
  gem 'redcarpet', '~> 3.3.0'
  gem 'slim', '~> 3.0.3'
  gem 'simple-navigation', '~> 4.0'
  gem 'roar-rails', '~> 1.1.0'

  # Image
  gem 'carrierwave', '~> 1.2.2'
  gem 'cloudinary', '~> 1.1.7'

  # Validation
  gem 'date_validator', '~> 0.9'

  # Assets
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.2.0'
  gem 'sass-rails', '~> 5.0.0'

  gem 'jquery-rails'
  gem 'bootstrap-sass', '~> 3.1.0'

  # Server
  gem 'puma', '~> 3.4'

  # Config
  gem 'dotenv-rails'

  # Error handling
  gem 'rollbar', '~> 2.11.3'

  group :test do
    gem 'rspec-rails', '~> 3.8.1'
    gem 'rspec-its'
    gem 'factory_girl_rails'
    gem 'shoulda-matchers', '~> 3.1.2', require: false
    gem 'guard-rspec'
    gem 'timecop'
    gem 'ffaker'
    gem 'guard-rubocop'
    gem 'sqlite3'
  end

  group :development do
    gem 'i18n-tasks'

    gem 'pry-rails', require: false
    gem 'rubocop', '~> 0.40.0', require: false
    gem 'flog', require: false
    gem 'brakeman', require: false
  end

  group :production do
    gem 'rails_12factor'
  end
end

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap-markdown', '~> 2.5'
  gem 'rails-assets-marked', '~> 0.3.2'
  gem 'rails-assets-vis', '~> 3.12'
end
