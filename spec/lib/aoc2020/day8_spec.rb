# frozen_string_literal: true

RSpec.describe Aoc2020::Day8 do
  let(:input) do
    <<-TEST_INPUT
      nop +0
      acc +1
      jmp +4
      acc +3
      jmp -3
      acc -99
      acc +1
      jmp -4
      acc +6
    TEST_INPUT
  end

  let(:repaired_instructions) do
    [
      [:nop, 0],
      [:acc, 1],
      [:jmp, 4],
      [:acc, 3],
      [:jmp, -3],
      [:acc, -99],
      [:acc, 1],
      [:nop, -4],
      [:acc, 6]
    ]
  end

  let(:solver) { Aoc2020::Day8.new(input) }

  it 'solves part one' do
    expect(solver.part_one).to eq(5)
  end

  it 'repairs the corrupted instruction' do
    expect(solver.repair_corrupted_instruction).to eq(repaired_instructions)
  end

  it 'solves part two' do
    expect(solver.part_two).to eq(8)
  end
end
