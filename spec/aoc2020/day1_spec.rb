# frozen_string_literal: true

RSpec.describe Aoc2020::Day1 do
  let(:data) { %w[1721 979 366 299 675 1456] }
  subject { Aoc2020::Day1.new(data) }

  it 'solves part one' do
    expect(subject.part_one).to eq(514_579)
  end

  it 'solves part two' do
    expect(subject.part_two).to eq(241_861_950)
  end
end
