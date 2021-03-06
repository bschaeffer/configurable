# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "configurable/version"

Gem::Specification.new do |s|
  s.name        = "configurable"
  s.version     = Configurable::VERSION::STRING
  s.authors     = ["Braden Schaeffer"]
  s.email       = ["braden.schaeffer@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple, configuration object for your concerns}
  s.description = %q{A simple, configuration object for your concerns}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activesupport'
  s.add_dependency 'confstruct'

  s.add_development_dependency "rake", ">=0.8.7"
end