# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sain_smart/network_io/version'

Gem::Specification.new do |spec|
  spec.name          = 'sain_smart-network_io'
  spec.version       = SainSmart::NetworkIO::VERSION
  spec.authors       = ['Tim Foerster']
  spec.email         = ['github@mailserver.1n3t.de']

  spec.summary       = 'Library to get sainsmart network_io usable.'
  spec.homepage      = 'https://gibhub.com/dopykuh/sain_smart-network_io'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
