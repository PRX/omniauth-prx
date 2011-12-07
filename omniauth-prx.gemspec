# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth/prx/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-prx"
  s.version     = OmniAuth::PRX::VERSION
  s.authors     = ["Andrew Kuklewicz"]
  s.email       = ["andrew@prx.org"]
  s.homepage    = "https://github.com/prx/omniauth-prx"
  s.summary     = %q{PRX strategy for OmniAuth using OAuth2}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "omniauth-oauth2", '~> 1.0.0'

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
end
