class Request
  def parse(request)
    method, path, version = request.lines[0].split
    {
      path: path,
      method: method,
      headers: parse_headers(request)
    }
  end

  def parse_headers(request)
    headers = {}
    request.lines[1..-1].each do |line|
      return headers if line == "\r\n"
      header, val = line.split
      header = standardize(header)
      headers[header] = val
    end
  end

  def standardize(header)
    header.gsub(":", "").downcase.to_sym
  end
end
