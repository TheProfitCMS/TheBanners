$:.push File.expand_path("../lib", __FILE__)

require "the_banners/version"

Gem::Specification.new do |s|
  s.name        = "the_banners"
  s.version     = TheBanners::VERSION
  s.authors     = ["Dmitrii Komaritckii"]
  s.email       = ["dmitrii.komaritckii@izi.travel"]
  s.homepage    = "https://github.com/TheProfitCMS/"
  s.summary     = "Simple banner storage gem."
  s.description = "Simple banner storage gem."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 4.0"

  s.add_development_dependency "mysql2"
  s.add_development_dependency "paperclip", "~> 4.2"
  s.add_development_dependency "haml-rails"
  s.add_development_dependency "bootstrap-sass"
  s.add_development_dependency "the_string_to_slug", "~> 1.2"
end
