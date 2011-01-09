require 'rubygems'  
require 'rake'  
require 'echoe'
require 'rspec'
require 'rspec/core'
  
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "sshoot"
    gem.summary = %Q{Dead simple ssh manager for the command line}
    gem.description = %Q{A very simple to use manager for remembering ssh connections.}
    gem.email = "shawn@sssoftwarecreations.com"
    gem.homepage = "http://github.com/ShawnSpooner/sshoot"
    gem.authors = ["Shawn Spooner"]
    gem.add_development_dependency "rspec", ">= 2.1.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

  
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec