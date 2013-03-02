source 'http://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'embedded_associations'
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'
gem 'jquery-rails'
gem 'ember-rails', '>= 0.9.2', github: 'emberjs/ember-rails'
gem 'devise', '>= 2.2'
gem 'jquery-rails'

group :test do
  gem 'turn', '~> 0.8.3', require: false
end

group :test, :development do
  gem 'letter_opener'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end


group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
  gem 'anjlab-bootstrap-rails', '>= 2.2', :require => 'bootstrap-rails'
end


