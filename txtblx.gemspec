$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "txtblx/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "txtblx"
  s.version     = Txtblx::VERSION
  s.authors     = ['Codevise Solutions Ltd']
  s.email       = ['info@codevise.de']
  s.homepage    = "https://github.com/codevise/txtblx"
  s.summary     = "Editable, revisioned front-end texts for rails apps."
  s.description = "Txtblx provides a simple way to allow Active Admin users to edit interface copy."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency("rails", "~> 4.2.1")
  s.add_dependency('snaps', "~> 0")
  s.add_dependency('activeadmin')
  s.add_dependency('auto_html', "~> 1.6.4")

  s.add_development_dependency("sqlite3", "~> 1.3.10")
  s.add_development_dependency('rspec-rails', "~> 3.2")
  s.add_development_dependency('capybara', "~> 2.4.4")
  s.add_development_dependency('factory_girl_rails', "~> 4.5")

  # Test coverage via Codeclimate
  s.add_development_dependency 'codeclimate-test-reporter'

  s.test_files = Dir["spec/**/*"]
end
