# frozen_string_literal: true

require 'puma/plugin'
require 'ruby_kitty'

Puma::Plugin.create do
  def start(launcher)
    environment = ENV['RAILS_ENV'] || ENV['RACK_ENV']
    return unless %w[development test].include?(environment)

    launcher.events.on_booted do
      RubyKitty.render
    end
  end
end
