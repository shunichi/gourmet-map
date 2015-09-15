source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.1.13'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development

gem 'haml-rails'
gem 'font-awesome-sass'
gem 'bootstrap-sass'
gem 'compass-rails'

gem 'default_value_for'

gem 'simple_form'
gem 'redcarpet'

gem 'devise'

gem 'premailer-rails'

gem 'carrierwave'
gem 'rmagick'
gem 'fog'

gem 'acts-as-taggable-on'
gem 'acts_as_commentable'

gem 'nicescroll-rails'
gem 'growlyflash', '~> 0.6.0'

gem 'rails-i18n'
gem 'devise-i18n'
gem 'dotenv-rails'

gem 'newrelic_rpm'

group :development do
  # pry 0.10.0 has compatibility issue with hirb.
  # https://github.com/cldwalker/hirb/issues/81
  # gem 'pry'
  # gem 'pry-rails'
  # gem 'pry-doc'
  # gem 'pry-stack_explorer'
  # gem 'pry-byebug'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener_web'
  gem 'quiet_assets'
  gem 'bullet'
  gem 'erb2haml'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'puma'
end
