# frozen_string_literal: true

class Aoc2020
  class Day2
    attr_accessor :input, :part_one_valid_passwords, :part_one_invalid_passwords,
                  :part_two_valid_passwords, :part_two_invalid_passwords

    PASSWORD_DATA_REGEX = /(?<first>\d+)-(?<second>\d+) (?<character>.): (?<password>.*)/.freeze

    def initialize(input)
      @input = input
      @part_one_valid_passwords = []
      @part_one_invalid_passwords = []
      @part_two_valid_passwords = []
      @part_two_invalid_passwords = []
      part_one_validate_passwords
      part_two_validate_passwords
    end

    def part_one
      part_one_valid_passwords.length
    end

    def part_two
      part_two_valid_passwords.length
    end

    private

    def data
      @data || init_data
    end

    def init_data
      @data = input.map { |line| parse_password_data(line) }
    end

    def parse_password_data(data)
      data.match(PASSWORD_DATA_REGEX)&.named_captures&.transform_keys(&:to_sym)
    end

    def part_one_valid_password?(first:, second:, character:, password:)
      (first.to_i..second.to_i).include? password.scan(character).length
    end

    def part_one_validate_passwords
      data.each do |password_data|
        if part_one_valid_password?(**password_data)
          part_one_valid_passwords << password_data
        else
          part_one_invalid_passwords << password_data
        end
      end
    end

    def part_two_valid_password?(first:, second:, character:, password:)
      [password[first.to_i - 1], password[second.to_i - 1]].count(character) == 1
    end

    def part_two_validate_passwords
      data.each do |password_data|
        if part_two_valid_password?(**password_data)
          part_two_valid_passwords << password_data
        else
          part_two_invalid_passwords << password_data
        end
      end
    end
  end
end
