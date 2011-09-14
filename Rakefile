require 'rubygems'
begin
  require 'bundler/setup'
  require 'rake'
  require 'rdoc/task'
  require 'rspec/core'
  require 'rspec/core/rake_task'
  require 'coffee-script'
  require 'uglifier'
rescue LoadError
  puts "You must 'gem install bundler' and 'bundle install' to run rake tasks"
end

Bundler::GemHelper.install_tasks
RSpec::Core::RakeTask.new(:spec)
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'Koala-Rails'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :coffee do
  cs_path = File.expand_path('../vendor/assets/javascripts/fb_loader.js.coffee.erb', __FILE__)
  js_path = File.expand_path('../vendor/assets/javascripts/precompiled/fb_loader.js', __FILE__)
  min_path = File.expand_path('../vendor/assets/javascripts/precompiled/fb_loader.min.js', __FILE__)

  desc "Compile CoffeeScript source to Javascript"
  task :compile do
    puts "Compiling #{cs_path}"
    compiled = CoffeeScript.compile(File.read cs_path).gsub("<%= ", "").gsub(" %>", "") #.gsub("*/", "*/\n")
    File.open(js_path, "w") do |f|
      f.puts compiled
    end
  end
  task :minify => "coffee:compile" do
    puts "Minifying #{js_path}"
    uglified = Uglifier.compile(File.read(js_path))
    File.open(min_path, "w") do |f|
      f.puts uglified
    end
  end
end

task :default => :spec