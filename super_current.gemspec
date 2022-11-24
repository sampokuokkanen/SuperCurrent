require_relative "lib/super_current/version"

Gem::Specification.new do |s|
  s.name = "super_current"
  s.version = SuperCurrent::VERSION
  s.authors = ["Sampo Kuokkanen"]
  s.email = ["sampo.kuokkanen@gmail.com"]
  s.homepage = "https://www.google.com"
  s.summary = "SuperCurrent is a way to add magic to CurrentAttributes."
  s.description = "SuperCurrent adds more fun to your Rails app by making it harder to predict!"
  s.license = "MIT"

  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = s.homepage
  s.metadata["changelog_uri"] = s.homepage

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  s.add_dependency "rails", ">= 7.0.4"
  s.add_dependency "dry-configurable", "~> 1.0"

  s.add_development_dependency("standard")
end
