$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "baeneroid/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "baeneroid"
  s.version     = Baeneroid::VERSION
  s.authors     = ["Dmitrii Komaritckii"]
  s.email       = ["dmitrii.komaritckii@izi.travel"]
  s.homepage    = "TODO"
  s.summary     = "Simple banner storage gem."
  s.description = "Simple banner storage gem."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 4.1.5"

  s.add_development_dependency "mysql2"
end
