if ENV.fetch('RAILS_ENV', 'development') != 'production' &&
   Bundler.load.current_dependencies.any? { |gem| gem.name == 'ruby_kitty' }

  require 'ruby_kitty'

  after_booted do
    RubyKitty.render
  end
end
