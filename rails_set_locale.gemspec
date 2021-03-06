# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_set_locale/version'

Gem::Specification.new do |spec|
  spec.name = 'rails_set_locale'
  spec.version = RailsSetLocale::VERSION
  spec.authors = ['Panos Matsinopoulos']
  spec.email = ['panagiotis@matsinopoulos.gr']

  spec.summary = 'Encapsulate the logic to set the current locale for your Rails projects'
  spec.description = <<~DESC
    If your Rails application needs to support more than one locale, then this gem might be of help to you. Because
    it will set the locale using various defaults.
  DESC
  spec.homepage = 'https://pmatsinopoulos.github.io'
  spec.license = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'http_accept_language', '~> 2.1.1'

  spec.add_development_dependency 'actionpack', '>= 5'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'railties', '>= 4'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.54.0'
end
