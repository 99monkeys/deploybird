source 'http://rubygems.org'

gem 'rails', '~> 3.2.12'
gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '~> 3.3.4'
end

gem 'jquery-ui-rails'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails'
gem 'slim-rails'
gem 'sinatra'
gem 'omniauth-github'
gem 'yajl-ruby'
gem 'therubyracer'
gem 'faraday'
gem 'faraday_middleware'
gem 'rugged'
gem 'dotiw'
gem 'inherited_resources'
gem 'kaminari'
gem 'permanent_records'
gem 'simple_form', '~> 2'
gem 'open4'
gem 'ansible'
gem 'unicorn'

## CAPISTRANO
#
group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
end

# While these are not needed by Strano itself, without them installed, any project
# that requires them will die when Strano tries to run a cap task. By using
# :require => nil, these don't get required/loaded into Strano, but are installed
# for projects to use if needed.
gem 'delayed_job', :require => nil
gem 'whenever', :require => nil
gem 'airbrake', :require => nil
gem 'newrelic_rpm', :require => nil

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'marked'
  gem 'ffaker'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-pow'
  gem 'pry'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'vcr', '~> 2'
  gem 'webmock'
  gem "fakefs", :require => "fakefs/safe"
end
