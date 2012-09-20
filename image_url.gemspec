# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "image_url/version"

Gem::Specification.new do |s| 
  s.name        = "image_url"
  s.version     = ImageUrl::VERSION
  s.authors     = ["Benjamin Vetter"]
  s.email       = ["vetter@flakks.com"]
  s.summary     = %q{Smart generation of image urls}
  s.description = %q{Smart generation of image urls}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_dependency "actionmailer", ">= 2.3"
  s.add_dependency "actionpack", ">= 2.3"
  s.add_dependency "activesupport", ">= 2.3"
end

