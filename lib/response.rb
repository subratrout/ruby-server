class Response
  SERVER_ROOT = "../public"
  attr_reader :response_code

  def initialize(response_code: , data: "")
    @response_code = response_code
    @response = "HTTP/1.1 #{response_code}\r\n" +
                "Content-Length: #{data.size}\r\n" +
                "\r\n" +
                "#{data}\r\n"
  end

  def send(client)
    client.write(@response)
  end

  def self.create_response(req)
    if req.fetch(:path) == "/"
      respond_with(SERVER_ROOT + "/index.html")
    else
      respond_with(SERVER_ROOT + req.fetch(:path))
    end
  end

  def self.respond_with(path)
    if File.exists?(path)
      send_ok_with_response(File.binread(path))
    else
      send_file_not_found
    end
  end

  def self.send_ok_with_response(data)
    Response.new(response_code:200, data: data)
  end

  def self.send_file_not_found
    Response.new(response_code:404, data: File.binread(SERVER_ROOT + "/404.html"))
  end
end