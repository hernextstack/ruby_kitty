# frozen_string_literal: true

require_relative 'ruby_kitty/version'

module RubyKitty
  ROOT = File.expand_path('..', __dir__)
  ARTWORK = File.join(ROOT, 'purrtraits', 'default.md')
  RED = "\e[91m"
  RESET = "\e[0m"

  def self.render(io: $stdout, color: io.tty?)
    artwork = File.read(ARTWORK, encoding: 'UTF-8')
    artwork = artwork.gsub('♦', "#{RED}♦#{RESET}") if color
    io.puts artwork
  end
end
