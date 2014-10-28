source 'https://rubygems.org'

gem 'rails', '4.0.4'
gem 'therubyracer', '~> 0.12.1'
gem 'less-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'haml'
gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails', branch: 'bootstrap3'
gem 'gravatar-ultimate'
gem 'draper'
gem 'rails_admin'
gem 'i18n', github: 'svenfuchs/i18n'

# authentication
gem 'devise'
gem 'omniauth-facebook'

gem 'puma',   group: :production
gem 'mysql2', group: [:production, :test]

group :development, :test do
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'rspec-rails', '~> 2.14'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'codeclimate-test-reporter', require: nil
  gem 'sqlite3'
  gem 'dotenv-rails'
end