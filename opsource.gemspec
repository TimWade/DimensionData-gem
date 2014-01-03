# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "opsource/version"

Gem::Specification.new do |s|
  s.name        = "opsource"
  s.version     = Opsource::VERSION
  s.authors     = ["Tim Wade"]
  s.email       = ["pimpingeezer@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Opsource REST API client gem}
  s.description = %q{Simple wrapper to access opsource cloud's api'}

  s.rubyforge_project = "opsource"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'i18n'
  s.add_dependency 'active_support'
  s.add_dependency 'typhoeus'
  s.add_dependency 'xml-simple'
  s.add_dependency 'hashie'
  s.add_dependency 'colorize'
end
