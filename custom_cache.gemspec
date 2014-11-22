$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'custom_cache/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'custom_cache'
  s.version     = CustomCache::VERSION
  s.authors     = ['Chirag Viradiya']
  s.email       = ['chirag.viradiya@gmail.com']
  s.homepage    = 'TODO'
  s.summary     = 'A wrapper over Rails cache to provide request and session cache.'
  s.description = 'A wrapper over Rails cache to provide request and session cache.'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.0.10'

  s.add_development_dependency 'sqlite3'
end
