ruby "2.2.2"

source 'https://rubygems.org' do

  platforms :rbx do
    gem 'rubysl'
    gem 'rubysl-test-unit', require: false
    gem 'racc'
    gem 'psych'
  end

  gem 'rails', '~> 4.2.0'

  gem 'rails-i18n'

  # DB
  gem 'pg'

  # View
  gem 'redcarpet'
  gem 'slim', '~> 3.0.3'
  gem 'simple-navigation'
  gem 'roar-rails', '~> 1.0.1'

  # Image
  gem 'carrierwave'
  gem 'cloudinary'

  # Validation
  gem 'date_validator'

  # Assets
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.1.0'
  gem 'sass-rails', '~> 4.0.0'

  gem 'jquery-rails'
  gem 'turbolinks'
  gem 'bootstrap-sass', '~> 3.1.0'

  # Server
  gem 'puma'

  # Config
  gem 'dotenv-rails'

  # Error handling
  gem 'rollbar', '~> 1.5.1'

  group :test do
    gem 'rspec-rails', '~> 2.14.0'
    gem 'factory_girl_rails'
    gem 'shoulda-matchers'
    gem 'guard-rspec'
    gem 'timecop'
  end

  group :development do
    gem 'quiet_assets'
    gem 'i18n-tasks'
    gem 'pry-rails'
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
