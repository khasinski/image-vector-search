source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.1.2"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft", "~> 1.3.1"
# Use sqlite as the database for Active Record
gem "sqlite3", "~> 2.9.0"
gem "sqlite-vec", "~> 0.1.6"
gem "neighbor", "~> 0.6.0"
gem "tokenizers", "~> 0.6.3"

# Model runner
gem "onnxruntime", "~> 0.10.2"
gem "numo-narray", "~> 0.9.2"
gem "mini_magick", "~> 5.3.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 7.2.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails", "~> 2.2.3"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", "~> 2.0.23"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", "~> 1.3.4"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.14.1"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache", "~> 1.0.10"
gem "solid_queue", "~> 1.3.2"
gem "solid_cable", "~> 3.0.12"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "~> 1.23.0", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", "~> 2.10.1", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", "~> 0.1.18", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", "~> 13.0.0"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", "~> 8.0.2", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", "~> 1.1.0", require: false

  gem "rspec-rails", "~> 8.0.3"

  gem "factory_bot_rails", "~> 6.5.1"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", "~> 4.2.1"
end
