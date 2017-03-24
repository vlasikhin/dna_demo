source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'simple_form'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# gem 'therubyracer', platforms: :ruby

gem 'html2slim'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'slim'
gem 'slim-rails'
gem 'turbolinks', '~> 5'



group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rspec-rails', '~> 3.5'
  gem 'pry'
  gem 'fuubar'
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
