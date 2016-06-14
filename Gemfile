source 'https://rubygems.org'

gem 'rails', '4.2.5.2'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'slim'

# Below will replace Rails generators for ERB
# gem 'slim-rails'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'angular-rails-templates'
gem 'sdoc', '~> 0.4.0', require: false, group: :doc

# gem 'sass', '3.4.22'
gem 'bower-rails'
# Foreman should not be installed in Gemfile!
# gem 'foreman'


group :production, :staging do
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
  gem 'rails_serve_static_assets'
end
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'teaspoon', git: 'git://github.com/modeset/teaspoon.git'
  gem 'teaspoon-jasmine'
  gem 'byebug'
  gem 'rspec'
  gem 'rspec-rails', '~>2.0'
  gem 'factory_girl_rails', '~>4.0'
  gem 'capybara'
  gem 'database_cleaner'

  gem 'selenium-webdriver'
  gem 'phantomjs'

# gem 'poltergeist'

  gem 'capybara-angular'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
end

