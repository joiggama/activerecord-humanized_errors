# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord/humanized_errors/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord-humanized_errors'
  spec.version       = ActiveRecord::HumanizedErrors::VERSION
  spec.date          = '2014-03-08'
  spec.authors       = 'Ignacio Galindo'
  spec.email         = 'joiggama@gmail.com'
  spec.summary       = 'Adds humanized error messages to ActiveRecord models'
  spec.description   = %q{ This is not rocket science at all, this gem just adds a helper method to retrieve human friendly errors from ActiveRecord models. }
  spec.homepage      = 'https://github.com/joiggama/activerecord-humanized_errors'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake',    '~> 0'
end
