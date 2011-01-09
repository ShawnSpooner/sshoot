# Launcher is the main point of entry for sshoot commands; shell arguments are
# passd through to the launcher and routed
#
# Launcher also keeps track of one connection to Repo, which is how new data
# changes are persisted to disk. 
#
module Sshoot
  class Launcher
    
    def repo
      Sshoot.repo
    end
    
    def shell
      Sshoot.shot_shell
    end

    #Entry point into the ssh mananger
    #
    # args - array of commands to pass on for dispatch
    #        arg[0] is the name of the connection or the command to run
    #        arg[1] is the path for the ssh connection or the action to take on a name connection
    # Example 
    #   execute("test", "delete") will delete the connection named test
    #
    def execute(*args)
      friendly_name = args[0]
      connection_info   = args[1]

      return all unless friendly_name
      delegate(friendly_name, connection_info)
    end

    #Prints the supplied argument to the shot  shell
    #
    # text - the String to write to the shell
    #
    def write(text)
      shell.write(text)
    end

    #Public: prints all of the stored connections to the shell
    #
    #
    def all
      repo.connections.each do |name, connection|
        write "#{name} : #{connection}"
      end
    end

    # Method to dispatch to the correct call based on the provided arguments
    #
    # name - String the name of the connection, or the name of the command you want to run
    # connection - the path for the ssh connection, or the action to take on a connection
    #
    #Returns the result of the dispatch 
    def delegate(name, connection)
      return all  if name == 'all'
      return edit if name == 'edit'
      return help if name == 'help'
      return help if name[0] == 45

      if repo.connection_exists?(name)
        return delete_connection(name) if connection == 'delete'
        return search_connections(name)
      end

      return create_connection(name, connection)
    end

    # Add the supplied connection to the repo
    #
    # name - String the name of the connection
    # connection - the path for the ssh connection
    #
    #Returns true if the save was successful else false
    def create_connection(name, connection)
      repo.add(name, connection)
      write "Loaded a new round called #{name}."
      save!
    end

    def delete_connection(name)
      write "You sure you want to delete #{name}? (y/n):"
      if shell.read == 'y'
        repo.delete(name)
        write "#{name} just caught a bullet."
        save!
      else
        write "still one in the chamber"
      end
    end

    def search_connections(name)
      connection = repo.find(name)

      if connection
         shell.ssh(connection)
      else
        write("#{name} not found")
      end
    end

    def edit
      shell.write("I will be adding this soon")
    end

    def save!
      repo.save!
    end
    
    def help
      text = %{
        - sshoot: help ---------------------------------------------------

        sshoot                        display high-level overview
        sshoot all                    show all items in all lists
        sshoot edit                   edit the sshoot YML file in $EDITOR
        shoot  help                   this help text

        sshoot <name> <connection>    create a new connection
        sshoot <name>                 ssh into the connection
        sshoot <name> delete          deletes a connection

        Heavily inspired by Boom https://github.com/holman/boom
        all other documentation is located at:
        https://github.com/shawnspooner/sshoot
        }.gsub(/^ {8}/, '') # strip the first eight spaces of every line

        write text
      end
    end
  end