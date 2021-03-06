# -*- coding: utf-8 -*-
require 'test_helper'
require 'echo_server'
require 'net/http'

class ServerTest < Test::Unit::TestCase
  def self.setup
    Thread.new do
      EchoServer::Server.new(8887, '127.0.0.1').start
    end
    sleep 0.5 # старт сервера
  end

  def test_success_get
    ServerTest.setup
    Addrinfo.tcp("127.0.0.1", 8887).connect {|s|
      s.print "GET /?query=echo HTTP/1.0\r\n\r\n"
      assert_equal "HTTP/1.0 200 OK\r\nContent-Lenght: 4\r\n\r\necho\r\n", s.read
    }
  end

  def test_bad_request
    ServerTest.setup
    Addrinfo.tcp("127.0.0.1", 8887).connect {|s|
      s.print "GET / HTTP/1.0\r\n\r\n"
      assert_equal "HTTP/1.0 400 Bad Request\r\n", s.read
    }
  end
end
