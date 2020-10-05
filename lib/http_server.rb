dir = File.expand_path(__dir__)
require File.join(dir, 'request')
require File.join(dir, 'response')
require File.join(dir, 'response_builder')
require 'socket' # Access TCPServer and TCPSocket
require 'uri'
require 'pry'

# Initialize TCPServer object that will listen to 80 port on localhost
server = TCPServer.new('localhost', 8080)
puts "Starting the Server..................."
# process incoming connection in a loop
loop do
  client = server.accept

  # Read the first request line
  request = client.gets

  # Log the request to console for debugging purpose
  STDERR.puts(request)
  puts "Request data incoming ... #{request}"
  request = Request.new.parse(request)
  response = ResponseBuilder.new.create_response(request)

  puts "#{client.peeraddr[3]} #{request.fetch(:path)} - #{response.response_code}"
  puts "Locate IP: #{client.peeraddr(true)[2]}"
  response.send(client)
  client.close
end
