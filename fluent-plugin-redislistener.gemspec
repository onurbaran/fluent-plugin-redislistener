# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
Gem::Specification.new do |s|
s.name = "fluent-plugin-redislistener"
s.version = "0.0.1"
s.platform = Gem::Platform::RUBY
s.authors = ["Onur Baran"]
s.date = %q{2015-03-31}
s.email = "baranonur@gmail.com"
s.homepage = "https://github.com/onurbaran/fluent-plugin-redislistener"
s.summary = "fluentd plugin for redis list subscriber"
s.files = `git ls-files`.split("\n")
s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
s.require_paths = ["lib"]
s.add_dependency %q<fluentd>, ["~> 0.10.0"]
s.add_dependency %q<redis>, ["~> 2.2.2"]
end