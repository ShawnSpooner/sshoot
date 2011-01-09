require 'rubygems'  
require 'rake'  
require 'echoe'
require 'rspec'  
  
Echoe.new('sshoot', '0.0.1') do |p|  
  p.description     = "A dead simple ssh manager for the command line"  
  p.url             = "http://github.com/sspooner/sshoot"  
  p.author          = "Shawn Spooner"  
  p.email           = "shawn@sssoftwarecreations.com"  
  p.ignore_pattern  = ["tmp/*", "script/*"]  
  p.development_dependencies = []  
end  
  
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

desc  "Run all specs with rcov"
RSpec::Core::RakeTask.new(:spec) do |t|
	t.spec_opts = ["--color"]
	t.spec_files = FileList['spec/**/*_spec.rb']
end

desc "Run the rspec"
task :default => :spec