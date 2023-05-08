# frozen_string_literal: true
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.4'

gem 'active_link_to'
gem 'bootsnap', require: false
gem 'chartkick'
gem 'devise'
gem 'font-awesome-sass', '~> 6.2.1' # TODO: Move this
gem 'groupdate'
gem 'hashid-rails'
gem 'inline_svg'
gem 'jsbundling-rails'
gem 'omniauth'
gem 'omniauth-discord'
gem 'omniauth-rails_csrf_protection'
gem 'pg', '~> 1.1'
gem 'prizepicks'
gem 'puma', '~> 5.0'
gem 'redis', '~> 4.0'
gem 'rubocop', require: false
gem 'rubocop-performance', require: false
gem 'rubocop-rails', require: false
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'view_component'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'minitest-json-reporter'
end

group :development do
  gem 'hotwire-livereload'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'faker'
  gem "minitest-stub_any_instance"
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
