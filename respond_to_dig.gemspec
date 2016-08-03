# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'respond_to_dig/version'

Gem::Specification.new do |spec|
  spec.name          = "respond_to_dig"
  spec.version       = RespondToDig::VERSION
  spec.authors       = ["@ymkjp"]
  spec.email         = ["ymkjp@jaist.ac.jp"]
  spec.summary       = %q{Pure Ruby implementation of Array#dig and Hash#dig for Ruby < 2.3.}
  spec.homepage      = "https://github.com/announce/respond_to_dig"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
