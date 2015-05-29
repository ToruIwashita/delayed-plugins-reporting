# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delayed-plugins-reporting/version'

Gem::Specification.new do |spec|
  spec.name          = "delayed-plugins-reporting"
  spec.version       = Delayed::Plugins::Reporting::VERSION
  spec.authors       = ["Yusuke KUOKA"]
  spec.email         = ["yusuke.kuoka@crowdworks.co.jp"]
  spec.summary       = %q{A Delayed::Job plugin to report lifecycle events to log files or monitoring services, etc.}
  spec.homepage      = "https://github.com/crowdworks/delayed-plugins-reporting"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('delayed_job')

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
