# EchoServer

This is a simple http echo server on ruby that responds like "GET /?query=echo HTTP/1.0"

## Installation

    $ git clone https://github.com/Khelek/gem_echo_server.git

    $ cd gem_echo_server

    $ bundle && rake install
    
To run the test
    
    $ rake test

## Usage

By default server is running on port 8765

    $ server

For use a custom port:
    
    $ server -p 8888


