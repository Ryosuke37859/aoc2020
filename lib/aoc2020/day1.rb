# frozen_string_literal: true

class Aoc2020
  class Day1
    attr_accessor :input

    def initialize(input)
      @input = input
    end

    def part_one
      init_data && data.each do |op_one|
        data[1..].each do |op_two|
          sum = op_one + op_two
          break if sum > 2020
          return (op_one * op_two) if sum == 2020
        end
      end
    end

    def part_two
      init_data && data.each do |op_one|
        data[1..].each do |op_two|
          data[2..].each do |op_three|
            sum = op_one + op_two + op_three
            break if sum > 2020
            return (op_one * op_two * op_three) if sum == 2020
          end
        end
      end
    end

    private

    def data
      @data || init_data
    end

    def init_data
      # convert to integers and sort
      @data = input.map(&:to_i).sort
    end
  end
end
