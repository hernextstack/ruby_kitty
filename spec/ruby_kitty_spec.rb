# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RubyKitty do
  describe '.render' do
    let(:io) { StringIO.new }

    it 'prints the kitty from the bundled Markdown file' do
      described_class.render(io: io, color: false)
      expect(io.string).to include('Hello, Ruby Kitty!')
      expect(io.string).to include('♦')
    end

    it 'colors the ruby bright red when enabled' do
      described_class.render(io: io, color: true)
      expect(io.string).to include("\e[91m♦\e[0m")
    end

    it 'omits ANSI escapes when colors are disabled' do
      described_class.render(io: io, color: false)
      expect(io.string).not_to include("\e[")
    end
  end
end
