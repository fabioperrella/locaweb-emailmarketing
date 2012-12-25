# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "locaweb-emailmarketing/version"

Gem::Specification.new do |s|
  s.name        = "locaweb-emailmarketing"
  s.version     = Locaweb::Emailmarketing::VERSION
  s.authors     = ["Fabio Perrella"]
  s.email       = ["fabio.perrella@gmail.com"]
  s.homepage    = "https://github.com/fabioperrella/locaweb-emailmarketing"
  s.summary     = %q{APIs for Locaweb EmailMarketing http://emailmarketing.locaweb.com.br/trial}
  s.description = %q{APIs for Locaweb EmailMarketing http://emailmarketing.locaweb.com.br/trial}

  s.rubyforge_project = "locaweb-emailmarketing"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-debugger"
  s.add_development_dependency "webmock"
  s.add_development_dependency "vcr"
  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "json"
end
