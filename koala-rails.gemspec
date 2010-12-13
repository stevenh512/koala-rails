# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "koala-rails/version"

Gem::Specification.new do |s|
  s.name        = "koala-rails"
  s.version     = KoalaRails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Steven Hancock"]
  s.email       = ["stevenh512@gmail.com"]
  s.homepage    = "https://github.com/stevenh512/koala-rails"
  s.summary     = "Installer and helpers for using Koala with Rails 3"
  s.description = "Installer and helpers for using Koala with Rails 3"

  s.required_rubygems_version = ">= 1.3.6"

  # lol - required for validation
  s.rubyforge_project         = "koala-rails"

  # If you have other dependencies, add them here
  s.add_dependency("koala", "~> 0.9.0")

  s.add_development_dependency("bundler", "~> 1.0.7")
  s.add_development_dependency("rake", "~> 0.8.7")

  # If you need to check in files that aren't .rb files, add them here
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # If you need an executable, add it here
  # s.executables = ["koala-rails"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"

  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]

  s.rdoc_options << "--title" << "koala-rails" <<
                    "--main" << "README.rdoc" <<
                    "--inline-source" << "--line-numbers"
end

