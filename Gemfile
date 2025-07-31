source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Rubyのバージョンを3.1.4に統一
ruby '3.1.4'

# Railsのバージョンを6.1.7に統一
gem 'rails', '~> 6.1.7'

# データベース設定
gem 'mysql2', '>= 0.4.4'
group :production do
  gem 'pg'
end

# フロントエンド関連
gem 'webpacker', '~> 4.0'
gem 'sass-rails', '~> 5'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

# その他
gem 'puma', '~> 3.11'
gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'image_processing', '~> 1.2' # 重複を削除
gem 'mini_magick'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'active_hash'
gem 'payjp'
gem 'pry-rails'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.0'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  # Capistrano関連はデプロイ用なので、開発環境でのみ必要ならここにまとめる
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # webdrivers gemは不要なので削除
end