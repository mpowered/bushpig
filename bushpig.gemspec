# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bushpig/version'

Gem::Specification.new do |spec|
  spec.name          = 'bushpig'
  spec.version       = Bushpig::VERSION
  spec.authors       = ['Shaun Sharples']
  spec.email         = ['shaun.sharples@gmail.com']

  spec.summary       = 'Simple job system.'
  spec.description   = 'Simple job system.'
  spec.homepage      = 'https://github.com/mpowered/bushpig'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.3'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/mpowered/bushpig'
  spec.metadata['changelog_uri'] = 'https://github.com/mpowered/bushpig/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = ['bushpig']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.2.33'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '>= 13.2'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'connection_pool', '~> 2.2'
  spec.add_dependency 'json',            '>= 1.8'
  spec.add_dependency 'redis',           '<= 5.3.0'
  spec.add_dependency 'thor',            '~> 1.0'
end
