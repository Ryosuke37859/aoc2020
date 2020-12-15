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

  let(:part_two_boarding_passes) do
    [
      { column: 4, row: 6, seat_id: 52 },
      { column: 5, row: 6, seat_id: 53 },
      { column: 6, row: 6, seat_id: 54 },
      { column: 7, row: 6, seat_id: 55 },
      { column: 0, row: 7, seat_id: 56 },
      { column: 1, row: 7, seat_id: 57 },
      { column: 2, row: 7, seat_id: 58 },
      { column: 3, row: 7, seat_id: 59 },
      { column: 5, row: 7, seat_id: 61 },
      { column: 6, row: 7, seat_id: 62 },
      { column: 7, row: 7, seat_id: 63 },
      { column: 0, row: 8, seat_id: 64 },
      { column: 1, row: 8, seat_id: 65 },
      { column: 2, row: 8, seat_id: 66 },
      { column: 3, row: 8, seat_id: 67 },
      { column: 4, row: 8, seat_id: 68 },
      { column: 5, row: 8, seat_id: 69 }
    ]
  end

  it 'solves part two' do
    allow(solver).to receive(:boarding_passes) { part_two_boarding_passes }
    expect(solver.boarding_passes).to eq(part_two_boarding_passes)
    expect(solver.part_two).to eq(60)
  end
end
