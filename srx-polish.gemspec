# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "srx-polish"
  s.version     = "0.2.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Aleksander Pohl"]
  s.email       = ["apohllo@o2.pl"]
  s.homepage    = "http://github.com/apohllo/srx2ruby"
  s.summary     = %q{Polish sentence and word segmentation rules.}
  s.description = %q{Polish sentence and word segmentation rules. The sentence segmentation rules are based on Marcin Miłkowski's SRX rules.}

  s.rubyforge_project = "srx-polish"
  s.has_rdoc = false

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("term-ansicolor", ["~> 1.0.5"])
end
