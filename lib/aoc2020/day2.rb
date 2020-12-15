# frozen_string_literal: true

class Aoc2020
  class Day2
    attr_accessor :input, :valid_passwords, :invalid_passwords

    PASSWORD_DATA_REGEX = /(?<min>\d+)-(?<max>\d+) (?<character>.): (?<password>.*)/.freeze

    def initialize(input)
      @input = input
      @valid_passwords = []
      @invalid_passwords = []
      validate_passwords
    end

    def part_one
      valid_passwords.length
    end

    def part_two; end

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

    def valid_password?(min:, max:, character:, password:)
      (min.to_i..max.to_i).include? password.scan(character).length
    end

    def validate_passwords
      data.each do |password_data|
        if valid_password?(**password_data)
          valid_passwords << password_data
        else
          invalid_passwords << password_data
        end
      end
    end
  end
end
