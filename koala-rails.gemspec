# -*- encoding: utf-8 -*-
require "bundler"
require File.expand_path("../lib/koala-rails/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "koala-rails"
  s.version     = KoalaRails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Steven Hancock"]
  s.email       = ["stevenh512@gmail.com"]
  s.homepage    = "http://github.com/stevenh512/koala-rails"
  s.summary     = "Installer and helpers for using Koala with Rails 3"
  s.description = "Installer and helpers for using Koala with Rails 3"

  s.required_rubygems_version = ">= 1.3.6"

  # lol - required for validation
  s.rubyforge_project         = "koala-rails"

  # If you have other dependencies, add them here
  s.add_bundler_dependencies

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "{lib}/**/*.tt", "LICENSE", "README.rdoc"]
  s.require_path = 'lib'

  # If you need an executable, add it here
  # s.executables = ["koala-rails"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"

  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]

  s.rdoc_options << "--title" << "koala-rails" <<
                    "--main" << "README.rdoc" <<
                    "--inline-source" << "--line-numbers"
end