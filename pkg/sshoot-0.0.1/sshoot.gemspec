# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sshoot}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Shawn Spooner"]
  s.date = %q{2011-01-08}
  s.description = %q{A dead simple ssh manager for the command line}
  s.email = %q{shawn@sssoftwarecreations.com}
  s.extra_rdoc_files = ["README", "lib/sshoot.rb", "lib/sshoot/launcher.rb", "lib/sshoot/repo.rb"]
  s.files = ["README", "RakeFile", "lib/sshoot.rb", "lib/sshoot/launcher.rb", "lib/sshoot/repo.rb", "Rakefile", "Manifest", "sshoot.gemspec"]
  s.homepage = %q{http://github.com/sspooner/sshoot}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Sshoot", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{sshoot}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A dead simple ssh manager for the command line}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
