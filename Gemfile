source 'https://rubygems.org'

ruby '1.9.3', :group => :production

gem 'rails', '3.2.13'

group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'haml-rails'
gem 'bootstrap-sass', '>= 2.3.0.0'
gem 'figaro', '>=0.6.3'
gem 'devise', '>= 2.2.3'
gem 'cancan'
gem 'rolify', :git => 'git://github.com/EppO/rolify.git'

gem 'simple_form', '>= 2.1.0'

# Gems for production
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '>= 2.12.2'
  gem 'factory_girl_rails', '>= 4.2.0'
  gem 'annotate'
end


group :development do
  gem 'rename'
  gem 'quiet_assets'
  gem 'binding_of_caller', '>= 0.7.1', :platforms => [:mri_19, :rbx]
end


group :test do
  gem 'database_cleaner', '>= 1.0.0.RC1'
  gem 'email_spec', '>= 1.4.0'
  gem 'cucumber-rails', '>= 1.3.1', :require => false
  gem 'launchy', '>= 2.2.0'
  gem 'capybara', '>= 2.0.3'
end