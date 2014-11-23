$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
	s.name = "ro_r4py"
	s.version = "0.0.1"
	s.authors = ['']
	s.email = ['']
	s.homepage = ""
	s.summary = ""
	s.description = ""

	s.files = Dir["{app,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "conf/ro_r4py.rb"]

	s.test_files = Dir["spec/**/*"]

	s.add_dependency "rails", ">= 4.0.0"
end

