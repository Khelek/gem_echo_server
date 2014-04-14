module EchoServer
  class Parser
    def self.parse_http_param(http_query, param)
      http_parts = http_query.scan(/[^ ]+/)
      if http_parts.count == 3 and http_parts[0] == "GET" and http_parts[1] =~ /^\/\?#{param}=([^ ]*)$/ and http_parts[2] =~ /HTTP\/1.0[\r\n]/
        query = http_parts[1].match(/^\/\?#{param}=([^ ]*)$/)[1]
        return query
      else
        return nil
      end
    end
  end
end
