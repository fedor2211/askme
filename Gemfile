source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.1"
gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "gravtastic"
gem "font-awesome-rails"
gem "dotenv-rails", "~> 2.8"
gem "recaptcha", "~> 5.12"

group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "bullet", "~> 7.0"
end

group :production do
  gem "pg"
end
