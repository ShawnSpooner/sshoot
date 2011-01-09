begin
  require 'rubygems'
rescue LoadError
end

require 'fileutils'
require 'yaml'

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require 'sshoot/launcher'
require 'sshoot/repo'
require 'sshoot/shot_shell'

module Sshoot
  VERSION = '0.0.1'

  def self.repo
    @repo ||= Sshoot::Repo.new
  end
  
  def self.shot_shell
    @shell ||= Sshoot::ShotShell.new
  end
  
  def self.file_path
    @file_path = "#{ENV['HOME']}/.sshoot"
  end
end