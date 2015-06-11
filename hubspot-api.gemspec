# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hubspot-api/version'

Gem::Specification.new do |spec|
  spec.name = 'hubspot-api'
  spec.version = Hubspot::VERSION
  spec.authors = ['Keith Layne']
  spec.email = ['keith@laynes.org']

  spec.summary = 'Hubspot API for Ruby'
  spec.description = 'A simple ActiveModel-compliant wrapper for the Hubspot API'
  spec.homepage = 'https://github.com/keithlayne/hubspot-api'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # spec.add_runtime_dependency 'active_attr'
  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'faraday_middleware'

  spec.add_development_dependency 'activemodel'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
