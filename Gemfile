source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end



gem 'activeadmin', '~> 1.3'
gem 'activeadmin_addons'
gem 'aws-sdk-s3'
gem 'devise', '~> 4.4'
gem 'haml', '~> 5.0'
gem 'meta-tags', '~> 2.10'
gem 'activerecord-pg_enum', '~> 0.2.1'
gem 'pundit', '~> 2.0'
gem 'serviceworker-rails', '~> 0.5.5'
gem 'simple_form', '~> 4.0'
group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'binding_of_caller'
  gem 'rspec-rails'
  gem 'rspec'
  gem 'bundler-audit'
  gem 'spinach-rails'
  gem 'spinach'
end

group :development do
  gem 'spring-commands-rspec'
  gem 'better_errors'
  gem 'foreman'
  gem 'haml-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'spring-commands-spinach'
  gem 'cuprite'
  gem 'capybara-screenshot'
  gem 'rspec-collection_matchers'
  gem 'pundit-matchers'
  gem 'timecop'
  gem 'email_spec'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end
