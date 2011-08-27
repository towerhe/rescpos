# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rescpos/version"

Gem::Specification.new do |s|
  s.name        = "rescpos"
  s.version     = Rescpos::VERSION
  s.authors     = ["Tower He"]
  s.email       = ["towerhe@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A ruby implementation of the Line Thermal Printer ESC/POS Command Specifications}
  s.description = %q{Print formatted docs with Winpos WP-800}

  s.rubyforge_project = "rescpos"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
