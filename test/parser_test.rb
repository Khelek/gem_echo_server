# -*- coding: utf-8 -*-
require 'test_helper'

class ParserTest < Test::Unit::TestCase
  def test_success_parse
    assert_equal "echo", EchoServer::Parser.parse_http_param("GET /?query=echo HTTP/1.0\r\n", "query") 
  end

  def test_bad_parse
    assert_equal nil, EchoServer::Parser.parse_http_param("GET /?not_param=echo HTTP/1.0\r\n", "query") 
  end
end
