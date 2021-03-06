# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sshoot}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Shawn Spooner"]
  s.date = %q{2011-01-08}
  s.default_executable = %q{sshoot}
  s.description = %q{A very simple to use manager for remembering ssh connections.}
  s.email = %q{shawn@sssoftwarecreations.com}
  s.executables = ["sshoot"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README"
  ]
  s.files = [
    "LICENSE",
     "README",
     "Rakefile",
     "VERSION",
     "bin/sshoot",
     "lib/sshoot.rb",
     "lib/sshoot/launcher.rb",
     "lib/sshoot/repo.rb",
     "lib/sshoot/shot_shell.rb",
     "pkg/sshoot-0.0.1.gem",
     "pkg/sshoot-0.0.1.tar.gz",
     "pkg/sshoot-0.0.1/Manifest",
     "pkg/sshoot-0.0.1/README",
     "pkg/sshoot-0.0.1/Rakefile",
     "pkg/sshoot-0.0.1/lib/sshoot.rb",
     "pkg/sshoot-0.0.1/lib/sshoot/launcher.rb",
     "pkg/sshoot-0.0.1/lib/sshoot/repo.rb",
     "pkg/sshoot-0.0.1/sshoot.gemspec",
     "pkg/sshoot-0.1.0.gem",
     "spec/fixtures/sample.yml",
     "spec/launcher_spec.rb",
     "spec/repo_spec.rb",
     "spec/spec_helper.rb",
     "sshoot.gemspec"
  ]
  s.homepage = %q{http://github.com/ShawnSpooner/sshoot}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Dead simple ssh manager for the command line}
  s.test_files = [
    "spec/launcher_spec.rb",
     "spec/repo_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.1.0"])
    else
      s.add_dependency(%q<rspec>, [">= 2.1.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.1.0"])
  end
end

