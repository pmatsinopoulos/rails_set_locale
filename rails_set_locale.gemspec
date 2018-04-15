
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_set_locale/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_set_locale'
  spec.version       = RailsSetLocale::VERSION
  spec.authors       = ['Panos Matsinopoulos']
  spec.email         = ['panagiotis@matsinopoulos.gr']

  spec.summary       = %q{Encapsulate the logic to set the current locale for your Rails projects}
  spec.description   = %q{If your Rails application needs to support more than one locale, then this gem might be of help to you. Because it will set the locale using various defaults.}
  spec.homepage      = 'https://pmatsinopoulos.github.io'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.54.0"
end
