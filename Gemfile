source 'https://rubygems.org'

gem 'rails'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
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
  gem 'debug', platforms: %i[mri windows]
end

group :development do
  gem 'haml_lint'
  # NOTE: rails haml:erb2hamlをするために必要だった
  gem 'html2haml'
  gem 'sgcop', github: 'SonicGarden/sgcop'
  gem 'web-console'
end
