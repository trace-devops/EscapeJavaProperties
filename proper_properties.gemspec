# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proper_properties/version'

Gem::Specification.new do |spec|
  spec.name          = "proper_properties"
  spec.version       = ProperProperties::VERSION.dup
  spec.authors       = ["Tnarik Innael"]
  spec.email         = ["tnarik@lecafeautomatique.co.uk"]
  spec.summary       = %q{Loader and writer for *.properties files}
  spec.description   = %q{Tool for loading and writing Java properties files}
  spec.homepage      = "https://github.com/tnarik/proper_properties"
  spec.license       = "MIT"

  spec.files = %w(LICENSE README.md Rakefile proper_properties.gemspec)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.test_files = Dir.glob("spec/**/*.rb")
  spec.test_files = Dir.glob("spec/fixtures/**/*.properties")

  spec.required_rubygems_version = '>= 1.3.5'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'inch'
end