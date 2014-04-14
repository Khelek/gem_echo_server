require 'echo_server/parser'
require 'echo_server/http'
require 'socket'
module EchoServer
  # module Server?
  class Server
    def initialize(port=8765, host='127.0.0.1')
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
              param = EchoServer::Parser.parse_http_param(line, "query")
              line = conn.readline
              response = (param and line =~ /^[\r\n]+$/) ? EchoServer::Http.code_200(param) : EchoServer::Http.code_400
              conn.puts response
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
