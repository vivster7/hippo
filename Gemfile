source 'https://rubygems.org'

gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
gem 'pg'
#For Heroku deployment
group :production do
	gem 'rails_12factor'
end

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'


gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :test, :development do
	gem 'rspec-rails'
  gem 'fixture_builder'
  gem 'nokogiri'
end


gem 'haml'
gem 'imgkit'
gem 'friendly_id', github: 'FriendlyId/friendly_id', branch: 'master'
gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'

gem 'omniauth-gplus'
gem 'secrets', :github => "austinfromboston/secrets"
