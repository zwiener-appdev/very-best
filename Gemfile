source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.1.4"


# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"

# Use jquery as the JavaScript library
gem "jquery-rails"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 3.0"
# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console"
  gem "listen", "~> 3.0.5"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "devise"
gem "starter_generators", :git => "https://github.com/raghubetina/starter_generators.git",  :branch => "firstdraft"
gem "font-awesome-sass", "~> 4.5.0"
gem "activeadmin"
gem "gmaps4rails"
gem "underscore-rails"
gem "kaminari"
gem "bootstrap4-kaminari-views"
gem "activerecord-import"
gem "ransack"
gem "momentjs-rails", ">= 2.9.0"
gem "bootstrap3-datetimepicker-rails", "~> 4.14.30"

group :development, :test do
  gem "faker"
  gem "dotenv-rails"
  gem "pry-rails"
  gem "grade_runner", github: "firstdraft/grade_runner"
  gem "web_git", github: "firstdraft/web_git"
  gem "console_ip_whitelist", github: "firstdraft/console_ip_whitelist"
  gem "draft_log", github: "firstdraft/draft_log"
  gem "better_errors"
  gem "binding_of_caller"
  gem "sqlite3", "~> 1.3.6"
end

group :development do
  gem "annotate"
  gem "awesome_print"
  gem "dev_toolbar", git: "https://github.com/firstdraft/dev_toolbar.git"
  gem "draft_generators", github: "firstdraft/draft_generators"
  gem "letter_opener"
  gem "meta_request"
  gem "wdm", platforms: [:mingw, :mswin, :x64_mingw]
end

group :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "webmock"
end

group :production do
  gem "pg"
  gem "rails_12factor"
end
