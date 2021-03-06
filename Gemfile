source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'figaro' # omniauth を安全に扱うため
# gem 'certified' # sslの設定
gem 'omniauth-facebook'
gem 'kaminari' # データの分割
gem 'devise'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby # javascriptランタイムのため追加
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# gem 'bcrypt-ruby', '3.1.1.rc1', :require => 'bcrypt' # windows環境 3.1.7だとエラーになるためバージョン修正

gem 'unicorn', :group => :server # サーバ指定追加 (windowsではunicornが使えない)

gem 'semantic-ui-sass', git: 'https://github.com/doabit/semantic-ui-sass.git' # デザイン

gem 'gravtastic' #ユーザー画像

gem 'rails-i18n' # エラーメッセージの日本語化
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem "ransack"
gem 'jquery-ui-rails'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'capistrano' #追加
  gem 'capistrano-bundler' #追加
  gem 'capistrano-rbenv' #追加
  gem 'capistrano-rails' #追加
  gem 'sqlite3' # 追加
  gem 'rubocop' # コーディングルールのチェック
  gem 'hirb'         # モデルの出力結果を表形式で表示するGem
  gem 'hirb-unicode' # 日本語などマルチバイト文字の出力時の出力結果のずれに対応

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem "meta_request"
end

group :production do
  gem 'sqlite3' #  追加
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
