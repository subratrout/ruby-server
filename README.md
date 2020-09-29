# HTTP Server build in Ruby

A simple HTTP server from scratch in Ruby.  This accepts GET requests and respond with the static file at the requested path in a valid HTTP response.  

The server listens on a TCP socket and parse incoming requests in order to respond to them appropriately.

# Following Scopes Need to be Implemented

* Support HTTP 1.1 requests

* Support GET requests only.  Respond with an appropriate HTTP response code to other request methods

* Serve only static files from the current working directory and subdirectories.

* Support concurrent requests, ie don't block on responding to new requests while responding to a prior request.  However, you don't need to handle a large number of concurrent requests; ability to scale isn't being tested.

* Consider basic security vulnerabilities such as directory traversal

* Consider error conditions and writing for robustness (within reason).  Think about what happens if there are network errors or malformed HTTP requests from the client

* Wherever possible, use the appropriate RFCs as your guide

* Directory listing for requests that correspond to a directory is NOT required

 

Note that this is a subset of the required minimal features for an HTTP server according to the RFCs.  That's to keep the scope reasonable for a challenge project.  If you have any questions about whether you need to implement something based on your understanding of an RFC, please feel free to ask about it.

 

# Restrictions

* For the implementation of the server, only the Ruby standard library is allowed, and nothing in the Net::HTTP or WEBrick modules are allowed.  You'll need to write your own code for parsing HTTP requests and building HTTP responses.

* However, you may use anything in the standard library to write tests for your code, including Net::HTTP or WEBrick.

 