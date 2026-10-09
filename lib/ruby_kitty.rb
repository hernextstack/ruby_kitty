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


# frozen_string_literal: true

module RubyKitty
  ROOT = File.expand_path('..', __dir__)
  PURRTRAITS_DIR = File.join(ROOT, 'purrtraits')

  DEFAULT_PURRTRAIT = 'default'

  RED = "\e[31m"
  RESET = "\e[0m"

  class PurrtraitNotFound < StandardError; end

  def self.available_purrtraits
    Dir.glob(File.join(PURRTRAITS_DIR, '*.md'))
       .map { |path| File.basename(path, '.md') }
       .sort
  end

  def self.render(
    purrtrait: ENV.fetch('RUBY_KITTY_PURRTRAIT', DEFAULT_PURRTRAIT),
    io: $stdout,
    color: io.tty?
  )
    unless available_purrtraits.include?(purrtrait)
      raise PurrtraitNotFound,
            "Unknown purrtrait '#{purrtrait}'. " \
            "Available: #{available_purrtraits.join(', ')}"
    end

    path = File.join(PURRTRAITS_DIR, "#{purrtrait}.md")
    artwork = File.read(path, encoding: 'UTF-8')

    artwork = artwork.gsub('♦', "#{RED}♦#{RESET}") if color

    io.puts artwork
  end
end

require 'ruby_kitty/railtie' if defined?(Rails::Railtie)