# frozen_string_literal: true

require 'rails/railtie'

module RubyKitty
  class Railtie < Rails::Railtie
    config.after_initialize do
      RubyKitty.render if Rails.env.development? || Rails.env.test?
    end
  end
end
