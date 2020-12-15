# frozen_string_literal: true

class Aoc2020
  class Day4
    CM_REGEX = /^(\d+)cm$/.freeze
    HCL_REGEX = /^#[a-f0-9]{6}$/.freeze
    IN_REGEX = /^(\d+)in$/.freeze
    PID_REGEX = /^\d{9}$/.freeze
    REQUIRED_FIELDS = %i[ecl pid eyr hcl byr iyr hgt].freeze
    VALID_ECL = %w[amb blu brn gry grn hzl oth].freeze

    def initialize(input)
      @data = format_data(input)
    end

    def part_one
      @data.map do |passport_data|
        passport_data if fields_present?(passport_data)
      end.compact.count
    end

    def part_two
      @data.map do |passport_data|
        passport_data if fully_valid?(passport_data)
      end.compact.count
    end

    private

    def format_data(input)
      input.split("\n\n").map do |unformatted_passport|
        parse_passport_data(unformatted_passport)
      end
    end

    def fully_valid?(data)
      return false unless fields_present?(data)

      REQUIRED_FIELDS.each do |field|
        return false unless send("valid_#{field}?", data[field])
      end
      true
    end

    def parse_passport_data(unformatted_passport)
      unformatted_passport.split.map do |pair|
        pair.split(':')
      end.to_h.transform_keys(&:to_sym)
    end

    def fields_present?(passport_data)
      (REQUIRED_FIELDS - passport_data.keys).empty?
    end

    def valid_byr?(byr)
      valid_year?(range: 1920..2002, year: byr)
    end

    def valid_ecl?(ecl)
      VALID_ECL.include? ecl
    end

    def valid_eyr?(eyr)
      valid_year?(range: 2020..2030, year: eyr)
    end

    def valid_hcl?(hcl)
      return false unless hcl.match(HCL_REGEX)

      true
    end

    def valid_hgt?(hgt)
      valid = valid_measurement?(CM_REGEX, 150..193, hgt)
      valid || valid_measurement?(IN_REGEX, 59..76, hgt)
    end

    def valid_measurement?(unit_regex, range, hgt)
      measurement = hgt.match(unit_regex)
      return false unless measurement
      return false unless range.include? measurement[1].to_i

      true
    end

    def valid_pid?(pid)
      return false unless pid.match(PID_REGEX)

      true
    end

    def valid_iyr?(iyr)
      valid_year?(range: 2010..2020, year: iyr)
    end

    def valid_year?(range:, year:)
      return false unless year.length == 4

      year = year.to_i
      return false unless range.include? year

      true
    end
  end
end
