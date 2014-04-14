module EchoServer
  class Http
    def self.code_200(response)
      "HTTP/1.0 200 OK\r\n"\
      "Content-Lenght: #{response.size}\r\n"\
      "\r\n"\
      "#{response}\r\n"
    end

    def self.code_400
      "HTTP/1.0 400 Bad Request\r\n"
    end
  end
end
