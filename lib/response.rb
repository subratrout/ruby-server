class Response
  attr_reader :response_code
  def initialize(response_code:, data: "")
    @response_code = response_code
    @response = "HTTP/1.1 #{response_code}\r\n"+
                "Content-Length: #{data.size}\r\n"+
                "\r\n"+
                "#{data}\r\n"
  end

  def send(client)
    client.write(@response)
  end
end
