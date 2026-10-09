# frozen_string_literal: true

require_relative 'lib/ruby_kitty/version'

Gem::Specification.new do |spec|
  spec.name = 'ruby_kitty'
  spec.version = RubyKitty::VERSION
  spec.summary = 'A purrfect Puma startup greeting'
  spec.description = 'RubyKitty displays a cute cat and a ruby when Puma boots in development or test.'
  spec.authors = ['RubyKitty contributors']
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1'

  spec.files = Dir[
    'lib/**/*.rb',
    'purrtraits/*.md',
    'README.md',
    'LICENSE.txt'
  ]

  spec.bindir = 'exe'
  spec.executables = ['ruby_kitty']
  spec.require_paths = ['lib']
  spec.metadata = { 'rubygems_mfa_required' => 'true' }
end
