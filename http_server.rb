require 'socket' # Access TCPServer and TCPSocket

# Initialize TCPServer object that will listen to 80 port on localhost
server = TCPServer.new('localhost', 2345)

# process incoming connection in a loop
while client = server.accept

  # Read the first request line
  request = client.gets

  # Log the request to console for debugging purpose
  STDERR.puts(request)

  response = "This is HTTP server built with Ruby."

  client.print "HTTP/1.1 200\r\n"
  client.print "Content-Type: text/html\r\n"
  client.print "Content-Length: #{response.bytesize}\r\n"

  client.print "\r\n"
  client.print response
  client.print "\r\n"
  client.close
end