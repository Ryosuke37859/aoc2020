# frozen_string_literal: true

RSpec.describe Aoc2020::Day5 do
  let(:input) do
    <<-TEST_INPUT
      FBFBBFFRLR
      BFFFBBFRRR
      FFFBBBFRRR
      BBFFBBFRLL
    TEST_INPUT
  end

  let(:boarding_passes) do
    [
      { row: 44, column: 5, seat_id: 357 },
      { row: 70, column: 7, seat_id: 567 },
      { row: 14, column: 7, seat_id: 119 },
      { row: 102, column: 4, seat_id: 820 }
    ]
  end

  let(:solver) { Aoc2020::Day5.new(input) }

  it 'decodes the boarding passes' do
    expect(solver.boarding_passes).to eq(boarding_passes)
  end

  it 'solves part one' do
    expect(solver.part_one).to eq(820)
  end

  it 'solves part two'
end
