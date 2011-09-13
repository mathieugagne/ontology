$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ontology/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ontology"
  s.version     = Ontology::VERSION
  s.authors     = ["Mathieu Gagne"]
  s.email       = ["mathieu@orangebrule.com"]
  s.homepage    = "http://www.orangebrule.com"
  s.summary     = "Ontology is a project to facilitate the create of resources for website of any size."
  s.description = "Ontology gives everyone the power to mold resources' relationships, create new ones and modify existing ones."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
