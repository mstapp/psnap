# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "psnap/version"

Gem::Specification.new do |s|
  s.name        = "psnap"
  s.version     = psnap::VERSION
  s.authors     = ["Mike Stapp"]
  s.email       = ["mestapp@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Take a snapshot of a process's 'ps' measurements over time}
  s.description = %q{To help measure process performance and behavior over time, psnap will record a process's periodic 'ps' measurements to a text file for further processing}

  s.rubyforge_project = "psnap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rdoc')
  s.add_development_dependency('rake','~> 0.9.2')
  s.add_dependency('methadone', '~>1.0.0.rc5')
  s.add_dependency('gem-man')
end
