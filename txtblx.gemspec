$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "txtblx/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "txtblx"
  s.version     = Txtblx::VERSION
  s.authors     = ["Vangelis Tsoumenis"]
  s.email       = ["kioopi@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Txtblx."
  s.description = "TODO: Description of Txtblx."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

  s.test_files = Dir["spec/**/*"]

  s.add_dependency('snaps')
end
