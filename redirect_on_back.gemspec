# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redirect_on_back/version'

Gem::Specification.new do |gem|
  gem.name          = "redirect_on_back"
  gem.version       = RedirectOnBack::VERSION
  gem.authors       = ["yossi-shasho"]
  gem.email         = ["jozard00@gmail.com"]
  gem.description   = %q{Prevent form re-submition when hitting 'back'. Instead, choose where to redirect the user if she hits 'back', e.g. to the edit page of the record that was created.}
  gem.summary       = %q{Prevent re-submission of a form by redirecting after hitting the back button. }
  gem.homepage      = "https://github.com/yossi-shasho/redirect_on_back"
  gem.licenses     = ['MIT', 'GPL-2']


  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "railties", ">= 3.1"
  gem.add_runtime_dependency "jquery-rails"
end
