
source 'https://rubygems.org'

#add role for members
gem "rolify"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
#use for user avatar
gem 'paperclip', '~> 4.1'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use devise for handling user
gem 'devise'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bootstrap-sass'
gem 'bootstrap_form'
gem 'bootstrap-generators', '~> 3.3.4'
gem 'bootstrap-select-rails'
gem 'will_paginate', '~> 3.0.6'



group :development, :test do
    gem 'rspec-rails'
    gem 'spring-commands-rspec'
    gem 'guard-rspec'
    gem 'rb-fsevent' #if `uname` =~ /Darwin/
    gem 'fabrication'
    gem 'byebug'
end

group :test do
    gem 'capybara'
    gem 'faker'
    gem 'shoulda-matchers'
    # gem 'selenium-webdriver'
    # gem 'capybara-webkit'
    # gem 'database_cleaner'
end

group :development do
    gem 'pry', '0.10.0'
    gem 'pry-nav', '0.2.4'
    gem 'thin', '1.6.2'
    gem 'web-console', '~> 2.0'
    gem 'letter_opener', '1.2.0'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
