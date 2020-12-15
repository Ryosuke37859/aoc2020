# frozen_string_literal: true

RSpec.describe Aoc2020::Day4 do
  let(:data) do
    <<-TEST_INPUT
      ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
      byr:1937 iyr:2017 cid:147 hgt:183cm

      iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
      hcl:#cfa07d byr:1929

      hcl:#ae17e1 iyr:2013
      eyr:2024
      ecl:brn pid:760753108 byr:1931
      hgt:179cm

      hcl:#cfa07d eyr:2025 pid:166559648
      iyr:2011 ecl:brn hgt:59in
    TEST_INPUT
  end

  subject { Aoc2020::Day4.new(data) }

  it 'solves part one' do
    expect(subject.part_one).to eq(2)
  end

  it 'solves part two'
end
