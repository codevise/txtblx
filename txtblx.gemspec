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
  s.add_dependency('snaps')
  s.add_dependency('activeadmin')
  s.add_dependency('auto_html')

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

  # Test coverage via Codeclimate
  s.add_development_dependency 'codeclimate-test-reporter'

  s.test_files = Dir["spec/**/*"]

end
