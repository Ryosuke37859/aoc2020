# frozen_string_literal: true

class Aoc2020
  class Day4
    def initialize(input)
      @data = format_data(input)
      @valid_passports = []
      @invalid_passports = []
    end

    def part_one
      required_fields = %i[ecl pid eyr hcl byr iyr hgt]
      @data.each do |passport_data|
        if fields_present?(required_fields, passport_data)
          @valid_passports << passport_data
        else
          @invalid_passports << passport_data
        end
      end
      @valid_passports.count
    end

    def part_two; end

    private

    def format_data(input)
      input.split("\n\n").map do |unformatted_passport|
        parse_passport_data(unformatted_passport)
      end
    end

    def parse_passport_data(unformatted_passport)
      unformatted_passport.split.map do |pair|
        pair.split(':')
      end.to_h.transform_keys(&:to_sym)
    end

    def fields_present?(fields, passport_data)
      passport_data.keys.&(fields).length == fields.length
    end
  end
end
