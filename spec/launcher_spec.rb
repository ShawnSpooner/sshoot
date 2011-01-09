require 'spec_helper'

describe Sshoot::Launcher do

  before(:each) do
    @shell = mock(Sshoot::ShotShell)
    @repo = mock(Sshoot::Repo)
    Sshoot.stub(:shot_shell).and_return(@shell)
    Sshoot.stub(:repo).and_return(@repo)
    @launcher = Sshoot::Launcher.new
  end
  
  describe 'execute' do
    it "no arguments should return all named connections if no connection name is given" do
      @repo.stub(:connections).and_return({'beta' => 'ubuntu@127.0.0.1', 'stage' => 'ubuntu@stage.server.com'})
      @shell.should_receive(:write).with("stage : ubuntu@stage.server.com").once
      @shell.should_receive(:write).with("beta : ubuntu@127.0.0.1").once
      @launcher.execute
    end
    
    it "all should return all named connections if no connection name is given" do
      @repo.stub(:connections).and_return({'beta' => 'ubuntu@127.0.0.1', 'stage' => 'ubuntu@stage.server.com'})
      @shell.should_receive(:write).with("stage : ubuntu@stage.server.com").once
      @shell.should_receive(:write).with("beta : ubuntu@127.0.0.1").once
      @launcher.execute("all")
    end
    
    it "stage, ubuntu should add a new connection when given name and path" do
      @repo.stub(:connection_exists?).with("stage").and_return(false)
      @repo.should_receive(:add).with("stage", "ubuntu@stage.server.com")
      @shell.should_receive(:write)
      @repo.should_receive(:save!).and_return(true)
      @launcher.execute("stage", "ubuntu@stage.server.com")
    end
    
    it "stage delete should remove the connection" do
      @repo.stub(:connection_exists?).with("stage").and_return(true)
      @shell.should_receive(:write).with("stage just caught a bullet.")
      @shell.should_receive(:write).with("You sure you want to delete stage? (y/n):")
      @shell.stub(:read).and_return("y")
      
      @repo.should_receive(:delete).with("stage")
      @repo.should_receive(:save!).once
      @launcher.execute("stage", "delete")
    end
    
    it "stage should the known connection" do
      @repo.stub(:connection_exists?).with("stage").and_return(true)
      @repo.stub(:find).with("stage").and_return('ubuntu@stage.server.com')
      @shell.should_receive(:ssh).with("ubuntu@stage.server.com").once
      @launcher.execute("stage")
    end
    
    it "help should write the help dialog" do
      @shell.should_receive(:write).once
      @launcher.execute("help")
    end
  end
  
  describe 'delete' do
    it "should remove the connection when the user presses y" do
      @shell.should_receive(:write).with("stage just caught a bullet.")
      @shell.should_receive(:write).with("You sure you want to delete stage? (y/n):")
      @shell.stub(:read).and_return("y")
      
      @repo.should_receive(:delete).with("stage")
      @repo.should_receive(:save!).once
      @launcher.delete_connection("stage")
    end
    
    it "should not remove the connection when the user presses n" do
      @shell.should_receive(:write).with("still one in the chamber")
      @shell.should_receive(:write).with("You sure you want to delete stage? (y/n):")
      @shell.stub(:read).and_return("n")
      
      @repo.should_not_receive(:delete)
      @launcher.delete_connection("stage")
    end
  end
  
  describe 'search_connections' do
    it "known connection should invoke ssh" do
      @repo.stub(:find).with("stage").and_return('ubuntu@stage.server.com')
      @shell.should_receive(:ssh).with("ubuntu@stage.server.com").once
      @launcher.search_connections("stage")
    end
    
    it "lacking connection should not invoke ssh" do
      @repo.stub(:find).with("stage").and_return(nil)
      @shell.should_not_receive(:ssh)
      @shell.should_receive(:write).with("stage not found")
      @launcher.search_connections("stage")
    end
  end
  
  describe 'create' do
    it "should ask the repo to add the connection by name" do
      @repo.should_receive(:add).once.with("stage", "ubuntu@stage.server.com")
      @repo.should_receive(:save!).once
      @shell.should_receive(:write).once.with("Loaded a new round called stage.")
      @launcher.create_connection("stage", "ubuntu@stage.server.com")
    end
  end
end