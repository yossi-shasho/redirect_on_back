# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redirect_on_back/version'

Gem::Specification.new do |gem|
  gem.name          = "redirect_on_back"
  gem.version       = RedirectOnBack::VERSION
  gem.authors       = ["yossi-shasho"]
  gem.email         = ["jozard00@gmail.com"]
  gem.description   = %q{Rails 3 and above: redirect after user has clicked the back button, e.g. to edit the newly created record instead of creating a new one.}
  gem.summary       = %q{Prevent re-submission of a form by redirecting after hitting the back button. }
  gem.homepage      = "https://github.com/yossi-shasho/redirect_on_back"
  gem.licenses     = ['MIT', 'GPL-2']


  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "railties", "~> 3.2"
end
