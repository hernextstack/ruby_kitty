# RubyKitty ♡

A tiny Ruby gem that prints **Hello, Ruby Kitty!** and a red ruby when Puma boots in development or test. No runtime gem dependencies.

## Install in a Rails application

Add to the **consuming Rails app's** `Gemfile`:

```ruby
group :development, :test do
  gem 'ruby_kitty', require: false
end
```

Until RubyKitty is published, use `gem 'ruby_kitty', path: '/path/to/ruby_kitty', require: false` instead.

In the consuming Rails application's `config/puma.rb`:

```ruby
if %w[development test].include?(ENV['RAILS_ENV'] || ENV['RACK_ENV'])
  plugin :ruby_kitty
end
```

Run `bundle install`, then `bin/rails server`. The Puma plugin prints the greeting once after Puma boots. This is opt-in, and the gem should not be installed in production bundles. Exclude development and test groups when building production images.

## CLI

After installation, run `ruby_kitty` to print the cat directly. Or in the gem checkout run `ruby -Ilib exe/ruby_kitty`.

## Development

```sh
bundle install
bundle exec rspec
bundle exec ruby -Ilib exe/ruby_kitty
gem build ruby_kitty.gemspec
```

## Color and logs

The ruby is a plain `♦` symbol, colored bright red with ANSI escapes only when output is a TTY. Captured container logs generally show a plain diamond, because ANSI colors are disabled by default for non-TTY output. For forced color use `RubyKitty.render(color: true)`.

## License

MIT. See `LICENSE.txt`.
