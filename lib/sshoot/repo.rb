# Storage is the middleman between changes the client makes in-memory and how
# it's actually persisted to disk (and vice-versa). There are also a few
# convenience methods to run searches and operations on the in-memory hash.
#
module Sshoot
  class Repo

    # Public: the path to the yml file used by sshoot.
    #
    # Returns the String path of sshoot's yml representation.
    def connections_file
      Sshoot.file_path
    end

    # Public: the in-memory collection of all connections attached to this Storage
    # instance.
    #
    # connections - a hash of name:connection pairs
    #
    attr_accessor :connections

    #Public: add the provided connection to the repository
    #
    # name - a string that is the friendly name of the connection
    # connection - the ssh connection information
    #
    # Examples
    #   add('Beta', 'ubuntu@127.0.0.1')
    def add(name, connection)
      @connections.store(name, connection)
    end

    #Public: initializes a Storage instance by loading in your persisted data.
    #
    # Returns the Storage instance.
    def initialize
      @connections = {}
      load_connections
    end

    # Public: tests whether a specific connection exists.
    #
    # name - the String name of an connection
    #
    # Returns true if found, false if not.
    def connection_exists?(name)
      @connections.include?(name)
    end

    # Public: find the connection by name
    #
    # name - the String name of an connection
    #
    # Returns the connection if found else returns nil
    def find(name)
      connection_exists?(name) ? @connections[name] : nil
    end

    #Save the in memory hash out to the file system
    #
    #Returns true if successful, false if unsuccessful.
    def save!
      File.open(connections_file, 'w') {|f| f.write(@connections.to_yml) }
    end

    private
    #Takes care of bootstrapping the YML file
    #
    # Return true if successfully saved.
    def bootstrap_connections
      FileUtils.touch(connections_file)
      save!
    end

    #Hydrate the connections hash from the yml storage file
    def load_connections
      @connections = YAML::load_file(connections_file)
    end

  end
end