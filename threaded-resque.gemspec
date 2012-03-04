# -*- encoding: utf-8 -*-
require File.expand_path('../lib/threaded-resque/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Carl Hörberg"]
  gem.email         = ["carl.hoerberg@gmail.com"]
  gem.description   = %q{Run Resque workers in threads instead of in forks}
  gem.summary       = %q{Run Resque workers in threads instead of in forks}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "threaded-resque"
  gem.require_paths = ["lib"]
  gem.version       = Threaded::Resque::VERSION
  gem.add_runtime_dependency 'resque'
end
