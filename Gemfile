source 'https://rubygems.org'
ruby '2.4.9'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11.3'
#gem 'pg', '~> 0.17.0'
gem 'sqlite3',         '~> 1.3.13'
gem 'thin',  '~> 1.8.0'
gem "devise", "~> 3.4.1"
gem "ancestry", "~> 2.0.0"
gem "ransack", "~> 1.4.1"


gem 'uglifier', '~> 2.1.1'  # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'  # Use CoffeeScript for .js.coffee assets and views
gem "jquery-rails", "~> 3.0.4"  # Use jquery as the JavaScript library
gem 'turbolinks', '~> 2.2.0'  # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 1.2'  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "haml", "~> 4.0.3"
gem 'bootstrap-sass', '~> 2.3.2.2'
gem 'sass-rails', '4.0.0'
gem "modernizr-rails", "~> 2.6.2.3"
gem "font-awesome-rails", "~> 4.0.3.0"
gem "bootstrap-datepicker-rails", "~> 1.1.1.9"
gem "bootstrap-select-rails", "~> 1.3.0.1"
gem "bootstrap-datetimepicker-rails", "~> 0.0.11"

gem 'datashift', '~> 0.40.1'
#gem 'datashift', git: 'https://github.com/20jeans/datashift.git'

gem "nokogiri"
gem "builder"
gem "rubyzip"
#gem "google-spreadsheet-ruby"
gem "spreadsheet"
gem "roo"

#compatability
gem 'bigdecimal', '1.3.0'
gem 'loofah', '~>2.19.1'

group :assets do
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
group :development do
  gem "quiet_assets", "~> 1.0.2"
end

group :development, :test do
  gem 'rspec-rails', '~> 3.2.1'
  gem 'guard-rspec', '~> 4.5.0'
end

group :test do
  gem "selenium-webdriver", "~> 2.35.1"
  gem "capybara", "~> 2.1.0"
  gem 'growl', '1.0.3'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
  gem 'unicorn'
  gem 'capistrano'
  gem 'capistrano-rails', '~>1.1'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
