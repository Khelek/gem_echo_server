require 'optparse'
require 'echo_server/server'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: server [OPTIONS]"
  opts.separator  ""
  opts.separator  "Options"

  opts.on("-p","--port PORT","Which port you want server run") do |port|
    options[:port] = port
  end

  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
    exit
  end

  opts.parse!
end

if port=options[:port]
  EchoServer::Server.new(port).start
else
  EchoServer::Server.new.start
end
