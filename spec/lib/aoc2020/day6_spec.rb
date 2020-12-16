# frozen_string_literal: true

RSpec.describe Aoc2020::Day6 do
  let(:input) do
    <<-TEST_INPUT
      abc

      a
      b
      c

      ab
      ac

      a
      a
      a
      a

      b
    TEST_INPUT
  end

  let(:solver) { Aoc2020::Day6.new(input) }

  it 'displays unique answers for each group' do
    expect(solver.group_unique_answers[0].count).to eq(3)
    expect(solver.group_unique_answers[1].count).to eq(3)
    expect(solver.group_unique_answers[2].count).to eq(3)
    expect(solver.group_unique_answers[3].count).to eq(1)
    expect(solver.group_unique_answers[3].count).to eq(1)
  end

  it 'solves part one' do
    expect(solver.part_one).to eq(11)
  end

  it 'displays unanimous answers for each group' do
    expect(solver.group_unanimous_answers[0].count).to eq(3)
    expect(solver.group_unanimous_answers[1].count).to eq(0)
    expect(solver.group_unanimous_answers[2].count).to eq(1)
    expect(solver.group_unanimous_answers[3].count).to eq(1)
    expect(solver.group_unanimous_answers[3].count).to eq(1)
  end

  it 'solves part two' do
    expect(solver.part_two).to eq(6)
  end
end
