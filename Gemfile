# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# gem 'redis-namespace'

gem 'listen', '~> 3.1.5'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'cancancan', '~> 1.16.0'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'faker', '~> 1.7.3'
  gem 'rails-controller-testing'
  gem 'rubocop', '~> 0.48.0', require: false
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Use Capistrano for deployment
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma'
end
