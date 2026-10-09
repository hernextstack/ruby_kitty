# frozen_string_literal: true

module RubyKitty
  ROOT = File.expand_path('..', __dir__)
  ARTWORK = File.join(ROOT, 'ruby_kitty.md')

  RED = "\e[31m"
  RESET = "\e[0m"

  def self.render(io: $stdout, color: io.tty?)
    artwork = File.read(ARTWORK, encoding: 'UTF-8')
    artwork = artwork.gsub('♦', "#{RED}♦#{RESET}") if color

    io.puts artwork
  end
end

require 'ruby_kitty/railtie' if defined?(Rails::Railtie)
