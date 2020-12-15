# frozen_string_literal: true

RSpec.describe Aoc2020::Day3 do
  let(:data) do
    [
      '..##.......',
      '#...#...#..',
      '.#....#..#.',
      '..#.#...#.#',
      '.#...##..#.',
      '..#.##.....',
      '.#.#.#....#',
      '.#........#',
      '#.##...#...',
      '#...##....#',
      '.#..#...#.#'
    ]
  end

  subject { Aoc2020::Day3.new(data) }

  it 'solves part one' do
    expect(subject.part_one).to eq(7)
  end

  it 'solves part two' do
    expect(subject.part_two).to eq(336)
  end
end
