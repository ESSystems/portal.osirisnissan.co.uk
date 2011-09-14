source 'http://rubygems.org'

gem 'rails', "~> 3.1.0.rc"

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'formtastic', "~> 2.0.0.rc"
gem 'rails3-jquery-autocomplete'
gem 'paperclip'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'forgery', '~> 0.5.0'
  
  # Guard stuff
  gem 'guard-rspec'
  gem 'guard-cucumber'

  # Pretty printed test output
  gem 'turn', :require => false

  gem 'simplecov'

  if RUBY_PLATFORM.downcase.include?("darwin")
  	gem 'rb-fsevent'
  	gem 'growl_notify'
  end
end
