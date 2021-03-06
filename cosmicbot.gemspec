# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cosmicbot/version'

Gem::Specification.new do |spec|
  spec.name          = "cosmicbot"
  spec.version       = Cosmicbot::VERSION
  spec.authors       = ["Sunny Ripert"]
  spec.email         = ["sunny@sunfox.org"]
  spec.description   = %q{Cosmic IRC Bot}
  spec.summary       = %q{Cosmic IRC Bot}
  spec.homepage      = "https://github.com/cosmic/cosmicbot"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "cinch"
  spec.add_runtime_dependency "dotenv"
end
