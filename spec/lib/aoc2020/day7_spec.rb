# frozen_string_literal: true

RSpec.describe Aoc2020::Day7 do
  let(:input) do
    <<-TEST_INPUT
      light red bags contain 1 bright white bag, 2 muted yellow bags.
      dark orange bags contain 3 bright white bags, 4 muted yellow bags.
      bright white bags contain 1 shiny gold bag.
      muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
      shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
      dark olive bags contain 3 faded blue bags, 4 dotted black bags.
      vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
      faded blue bags contain no other bags.
      dotted black bags contain no other bags.
    TEST_INPUT
  end

  let(:expected_rules) do
    {
      'light red' => {
        'bright white' => 1,
        'muted yellow' => 2
      },
      'dark orange' => {
        'bright white' => 3,
        'muted yellow' => 4
      },
      'bright white' => {
        'shiny gold' => 1
      },
      'muted yellow' => {
        'shiny gold' => 2,
        'faded blue' => 9
      },
      'shiny gold' => {
        'dark olive' => 1,
        'vibrant plum' => 2
      },
      'dark olive' => {
        'faded blue' => 3,
        'dotted black' => 4
      },
      'vibrant plum' => {
        'faded blue' => 5,
        'dotted black' => 6
      },
      'faded blue' => {},
      'dotted black' => {}
    }
  end

  let(:index_for_faded_blue) do
    {
      'muted yellow' => 9,
      'dark olive' => 3,
      'vibrant plum' => 5
    }
  end

  let(:bag_color) { 'shiny gold' }

  let(:solver) { Aoc2020::Day7.new(input) }

  it 'returns the expected rules' do
    expect(solver.rules).to eq(expected_rules)
  end

  it 'has an inverted index' do
    expect(solver.index['faded blue']).to eq(index_for_faded_blue)
  end

  it 'solves part one' do
    expect(solver.part_one(bag_color)).to eq(4)
  end

  let(:part_two_input) do
    <<-TEST_INPUT
      shiny gold bags contain 2 dark red bags.
      dark red bags contain 2 dark orange bags.
      dark orange bags contain 2 dark yellow bags.
      dark yellow bags contain 2 dark green bags.
      dark green bags contain 2 dark blue bags.
      dark blue bags contain 2 dark violet bags.
      dark violet bags contain no other bags.
    TEST_INPUT
  end

  let(:part_two_solver) { Aoc2020::Day7.new(part_two_input) }

  it 'solves part two' do
    expect(solver.part_two(bag_color)).to eq(32)
    expect(part_two_solver.part_two(bag_color)).to eq(126)
  end
end
