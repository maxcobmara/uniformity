source 'https://rubygems.org'
ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.8'
#gem 'pg', '~> 0.17.0'
gem 'sqlite3', '~> 1.3.13'
gem 'thin',  '~> 1.8.0'
gem "devise", "~> 4.4.0"
gem "ancestry", "~> 3.2.1"
gem "ransack", "~> 2.1.0"


gem 'uglifier', '~> 2.1.1'  # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2.0'  # Use CoffeeScript for .js.coffee assets and views
gem "jquery-rails", "~> 4.4.0"  # Use jquery as the JavaScript library
gem 'turbolinks', '~> 2.5.0'  # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0'  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "haml", "~> 5.1.0"
gem 'bootstrap-sass', '~> 3.4.0'
gem 'sass-rails', '6.0.0'
gem "modernizr-rails", "~> 2.7.1"
gem "font-awesome-rails", "~> 4.7.0"
gem "bootstrap-datepicker-rails", "~> 1.3.0"
gem "bootstrap-select-rails", "~> 1.3.0"
gem "bootstrap-datetimepicker-rails", "~> 0.0.11"

#gem 'datashift', '~> 0.40.4'  <-- deprecated rails 5.2
#gem 'datashift', git: 'https://github.com/20jeans/datashift.git'

gem "nokogiri", '~> 1.10.0'
gem "builder"
gem "rubyzip"
#gem "google-spreadsheet-ruby"
gem "spreadsheet"
gem "roo", "~> 2.5.0"

#compatability
gem 'bigdecimal', '1.3.0'
gem 'loofah', '~>2.9.0'
gem 'psych', '~> 3.3.0' 

group :assets do
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
group :development do
  #gem "quiet_assets", "~> 1.0.2"
  gem 'bullet', '~> 6.0'
  
end

group :development, :test do
  gem 'rspec-rails', '~> 3.5.0'
  gem 'guard-rspec', '~> 4.5.0'
end

group :test do
  gem "selenium-webdriver", "~> 2.53.0"
  gem "capybara", "~> 2.1.0"
  #gem 'growl', '1.0.3'
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
