require 'socket'
module EchoServer
  # module Server?
  class Server
    def initialize(host='127.0.0.1', port=8765)
      @host = host
      @port = port
      @server = TCPServer.open(host, port)
    end

    def start_message
      STDOUT.puts "The server is running on #{@host}:#{@port}"
      STDOUT.puts "Press CTL-C to terminate"
    end
    
    def start
      start_message
      while connection = @server.accept
        Thread.new(connection) do |conn|
          # port, host = conn.peeraddr[1,2]
          begin
            loop do
              line = conn.readline
              # add head parse
              conn.puts line
              conn.close
            end
          rescue EOFError
            conn.close
            puts "Client has disconnected"
          end
        end
      end
    end
  end
end
