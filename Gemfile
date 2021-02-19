source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
gem 'rails', '~> 6.1.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'slim-rails'
gem 'enum_help'
gem 'gretel'
gem 'kaminari'
gem 'kaminari-i18n'
gem 'bootstrap_form'
gem 'rails-i18n'
gem 'dotenv-rails'
gem 'hotwire-rails'
gem 'redis'

# ログイン
gem 'devise'
gem 'devise-i18n'

# 検索 gem 'ransack'

# 画像アップロード
gem 'carrierwave'
gem 'mini_magick'

# データ投入
gem 'seed-fu'
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara', '~> 2.13'
  gem 'spring-commands-rspec'
  gem 'selenium-webdriver'
end

group :development do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
  gem 'annotate'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
