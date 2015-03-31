# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
gem.name = "fluent-plugin-redislistener"
gem.version = "0.0.1"
gem.authors = ["Onur Baran"]
gem.email = ["baranonur@gmail.com"]
gem.summary = %q{Redis List Subscriber}
gem.description = %q{Fluentd plugin to redis list subscriber to persist your messages.}
gem.homepage = "https://github.com/onurbaran/fluent-plugin-redislistener"
gem.files = `git ls-files`.split($\)
gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
gem.require_paths = ["lib"]
gem.has_rdoc = false
gem.add_development_dependency "rake"
gem.add_development_dependency "fluentd"
gem.add_development_dependency "redis"
gem.add_runtime_dependency "fluentd"
gem.add_runtime_dependency "redis"
end