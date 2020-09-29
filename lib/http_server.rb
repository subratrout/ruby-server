dir = File.expand_path(__dir__)
require File.join(dir, 'request')
require File.join(dir, 'response')
require 'socket' # Access TCPServer and TCPSocket
require 'uri'
require 'pry'

# Initialize TCPServer object that will listen to 80 port on localhost
server = TCPServer.new('localhost', 2345)
puts "Starting the Server..................."
# process incoming connection in a loop
while client = server.accept

  # Read the first request line
  request = client.gets

  # Log the request to console for debugging purpose
  STDERR.puts(request)
  request = Request.new.parse(request)
  response = Response.create_response(request)

  puts "#{client.peeraddr[3]} #{request.fetch(:path)} - #{response.response_code}"

  response.send(client)
  client.close
end