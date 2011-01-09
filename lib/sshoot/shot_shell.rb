module Sshoot
  class ShotShell
    # Public: opens an ssh connection with the supplied information
    #
    # connection - the String that is the path to connect to
    #
    # Example
    #
    #   ssh('user@127.0.0.1')
    #
    # Returns true if found, false if not.
    def ssh(connection)
      puts "Starting ssh for #{connection}"
      exec "ssh #{connection}"
    end
    
    def read
      $stdin.gets.chomp
    end
    
    def write(data)
      puts data
    end
  end
end