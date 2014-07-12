source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.2'

platforms :rbx do
  gem 'rubysl'
  gem 'rubysl-test-unit', require: false
  gem 'racc'
  gem 'psych'
end

gem 'rails', '~> 4.1.0'

gem 'rails-i18n'

# DB
gem 'pg'

# View
gem 'redcarpet'
gem 'slim'
gem 'simple-navigation'
gem 'roar-rails'

# Image
gem 'carrierwave'
gem 'cloudinary'

# Validation
gem 'validates_timeliness'

# Assets
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'sass-rails', '~> 4.0.0'

gem 'bootstrap-sass', '~> 3.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'vis-rails'
gem 'rails-assets-bootstrap-markdown', '~> 2.5'
gem 'rails-assets-marked', '~> 0.3.2'

# Server
gem 'puma'

# Config
gem 'dotenv-rails'

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'guard-rspec'
end

group :development do
  gem 'quiet_assets'
  gem 'i18n-tasks'
end

group :production do
  gem 'rails_12factor'
end
