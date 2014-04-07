require 'optparse'
require 'echo_server/server'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: server [OPTIONS]"
  opts.separator  ""
  opts.separator  "Options"

  opts.on("-p","--port PORT","which port you want server run") do |port|
    options[:port] = port
  end

  opts.parse!
end

if opts[:port] = port
  Server.new(port=port).start
else
  Server.new.start
end
