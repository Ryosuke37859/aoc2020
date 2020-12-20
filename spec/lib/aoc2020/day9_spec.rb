# frozen_string_literal: true

RSpec.describe Aoc2020::Day9 do
  let(:input) do
    <<-TEST_INPUT
      35
      20
      15
      25
      47
      40
      62
      55
      65
      95
      102
      117
      150
      182
      127
      219
      299
      277
      309
      576
    TEST_INPUT
  end

  let(:preamble_length) { 5 }
  let(:solver) { Aoc2020::Day9.new(input) }

  before { solver.preamble_length = preamble_length }

  it 'solves part one' do
    expect(solver.part_one).to eq(127)
  end

  it 'solves part two' do
    expect(solver.part_two).to eq(62)
  end
end
