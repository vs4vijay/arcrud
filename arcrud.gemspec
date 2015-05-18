$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "arcrud/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "arcrud"
  s.version     = Arcrud::VERSION
  s.authors     = ["Vijay Soni"]
  s.email       = ["vs4vijay@gmail.com"]
  s.homepage    = "http://github.com/vs4vijay/arcrud"
  s.summary     = "Gem for CRUD Operation on Angular and Rails."
  s.description = "Angular Rails CRUD Operation Gem."
  s.license     = "WTFPL"

  s.files = Dir["{app,config,db,lib}/**/*", "WTFPL-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
end
