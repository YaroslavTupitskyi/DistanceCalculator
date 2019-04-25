lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'distance_calculator'

Gem::Specification.new do |spec|
  spec.name          = 'distance_calculator'
  spec.version       = DistanceCalculator::VERSION
  spec.authors       = ['YaroslavTupitskyi']
  spec.email         = ['yarik@active-bridge.com']

  spec.summary       = 'DistanceCalculator'
  spec.description   = 'DistanceCalculator'
  spec.homepage      = 'https://github.com/YaroslavTupitskyi/DistanceCalculator'
  spec.license       = 'MIT'
  spec.platform      = Gem::Platform::RUBY

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
