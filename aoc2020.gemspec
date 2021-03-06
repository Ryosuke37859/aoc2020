# frozen_string_literal: true

require_relative 'lib/aoc2020/version'

Gem::Specification.new do |spec|
  spec.name          = 'aoc2020'
  spec.version       = Aoc2020::VERSION
  spec.authors       = ['Levon Tarver']
  spec.email         = ['levon@createthree.com']

  spec.summary       = 'Example Gem for solving AOC 2020'
  spec.homepage      = 'https://github.com/Ryosuke37859/aoc2020'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['allowed_push_host'] = 'http://mygemserver.com' # TODO

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Ryosuke37859/aoc2020'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-nc'
  spec.add_development_dependency 'rubocop'
end
