require "bundler"
Bundler.setup

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

gemspec = eval(File.read("koala-rails.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["koala-rails.gemspec"] do
  system "gem build koala-rails.gemspec"
  system "gem install koala-rails-#{KoalaRails::VERSION}.gem"
end

