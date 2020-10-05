class ResponseBuilder
  SERVER_ROOT = "../public"
  def create_response(req)
    if req.fetch(:path) == "/"
      respond_with(SERVER_ROOT + "/index.html")
    else
      respond_with(SERVER_ROOT + req.fetch(:path))
    end
  end

  def respond_with(path)
    if File.exist?(path) && !File.directory?(path)
      send_ok_with_response(File.binread(path))
    else
      send_file_not_found
    end
  end

  def send_ok_with_response(data)
    Response.new(response_code: 200, data: data)
  end

  def send_file_not_found
    Response.new(response_code: 404, data: File.binread(SERVER_ROOT + "/404.html"))
  end
end
