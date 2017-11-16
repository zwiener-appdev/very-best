ruby '2.3.3'

source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

group :development do
  gem "sqlite3"
end

group :production do
  gem "pg"
  gem "rails_12factor"
end
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'starter_generators', :git => 'https://github.com/raghubetina/starter_generators.git',  :branch => 'firstdraft'
gem 'font-awesome-sass', '~> 4.5.0'
gem 'activeadmin', '~> 1.0.0.pre4'
gem 'inherited_resources', :git => 'https://github.com/activeadmin/inherited_resources.git'
gem 'gmaps4rails'
gem 'underscore-rails'
gem "kaminari"
gem "bootstrap4-kaminari-views"
gem 'seed_dump', :git => 'https://github.com/firstdraft/seed_dump.git'
gem 'activerecord-import'
gem "ransack"
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'

group :development, :test do
  gem 'faker'
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'grade_runner', github: 'firstdraft/grade_runner'
  gem 'web_git', github: 'firstdraft/web_git'
end

group :development do
  gem 'annotate'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'dev_toolbar', git: 'https://github.com/firstdraft/dev_toolbar.git'
  gem 'binding_of_caller'
  gem 'firstdraft_generators', github: 'firstdraft/firstdraft_generators'
  gem 'letter_opener'
  gem 'meta_request'
  gem 'wdm', platforms: [:mingw, :mswin, :x64_mingw]
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'webmock'
end
