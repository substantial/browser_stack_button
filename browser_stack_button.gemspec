# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'browser_stack_button/version'

Gem::Specification.new do |spec|
  spec.name          = "browser_stack_button"
  spec.version       = BrowserStackButton::VERSION
  spec.authors       = ["Aaron Jensen"]
  spec.email         = ["aaron@bustantial.com"]
  spec.summary       = %q{Add a button to your page to make testing with browser stack even easier.}
  spec.description   = %q{BrowserStack makes it really easy to test with different browsers, but this makes it even easier by adding a button to ever page and allowing you to quickly go through the browsers you need to test on.}
  spec.homepage      = "https://github.com/substantial/browser_stack_button"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 3.2 "
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
