# frozen_string_literal: true

RSpec.describe Aoc2020 do
  it 'has a version number' do
    expect(Aoc2020::VERSION).not_to be nil
  end

  it 'says hello' do
    expect(described_class.hello).to eq('hello')
  end
end
