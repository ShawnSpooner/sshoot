require 'spec_helper'

describe Sshoot::Launcher do

  before(:each) do
    Sshoot.stub(:file_path).and_return(File.join(File.dirname(__FILE__), '.','fixtures','sample.yml'))
    @repo = Sshoot::Repo.new
  end
  
  describe 'add' do
    it "should add the given connection" do
      @repo.add("test", "path")
      @repo.connections.should include("test" => "path")
    end
  end
  
  describe 'connections exists' do
    it "should return true for known connection" do
      @repo.connection_exists?("stage").should be true
    end
    
    it "should return false for unknown connection" do
      @repo.connection_exists?("bogus").should be false
    end
  end
  
  describe 'find' do
    it "should return the connection when the name is found" do
      @repo.find("test").should == "ubuntu@test.server.com"
    end
    
    it "should return nill when the name is not found" do
      @repo.find("bogus").should be nil
    end
  end
end