
require File.expand_path('../lib/atiga/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yamagishi Kazutoshi"]
  gem.email         = ["ykzts@desire.sh"]
  gem.description   = "atiga is atig append module collection."
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/ykzts/atiga"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "atiga"
  gem.require_paths = ["lib"]
  gem.version       = Atiga::VERSION
end
