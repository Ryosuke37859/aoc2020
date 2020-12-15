# frozen_string_literal: true

RSpec.describe Aoc2020::Day2 do
  let(:data) do
    [
      '1-3 a: abcde',
      '1-3 b: cdefg',
      '2-9 c: ccccccccc'
    ]
  end

  subject { Aoc2020::Day2.new(data) }

  it 'solves part one' do
    expect(subject.part_one).to eq(2)
  end
end
