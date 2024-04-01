source 'https://rubygems.org'

gem 'rails'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'devise'
gem 'devise-i18n'
gem 'faker'
gem 'haml-rails'
gem 'jsbundling-rails'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails-i18n'
gem 'simple_form'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'brakeman'
  gem 'brakeman_translate_checkstyle_format'
  gem 'bundler-audit'
  gem 'debug', platforms: %i[mri windows]
  gem 'rspec-rails'
  gem 'sgcop', github: 'SonicGarden/sgcop'
end

group :development do
  gem 'haml_lint'
  # NOTE: rails haml:erb2hamlをするために必要だった
  gem 'html2haml'
  gem 'web-console'
end
