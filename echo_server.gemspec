# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'echo_server/version'

Gem::Specification.new do |spec|
  spec.name          = "echo_server"
  spec.version       = EchoServer::VERSION
  spec.authors       = ["Dmitry Davydov"]
  spec.email         = ["haudvd@gmail.com"]
  spec.summary       = %q{Its is simple echo server, working at HTTP/1.0}
  spec.description   = %q{Server start by default on host 127.0.0.1 and port 8765.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
