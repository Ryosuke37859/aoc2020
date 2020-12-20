# frozen_string_literal: true

class Aoc2020
  class Day9
    attr_accessor :input, :preamble_length

    def initialize(input)
      @input = input.split("\n").map { |n| n.strip.to_i }
      @preamble_length = 25
    end

    def part_one
      invalid_numbers = find_invalid_numbers
      raise Error, 'more than one invalid number' if invalid_numbers.count > 1

      invalid_numbers.first
    end

    def part_two
      invalid_number = part_one
      input.each_with_index do |_, index|
        addends = find_contiguous_addends(invalid_number, input[index..])
        return addends.min + addends.max if addends
      end
    end

    private

    def find_invalid_numbers
      index = preamble_length
      input[preamble_length..].filter do |number|
        previous_numbers = @input[(index - preamble_length)...index]
        addends = valid_addends(previous_numbers, number)
        index += 1
        number if addends.empty?
      end
    end

    def find_contiguous_addends(target, numbers, addends = nil)
      to_sum = numbers[0..1]
      addends << numbers[1] if addends
      addends ||= to_sum
      numbers = [to_sum.sum, numbers[2..]].flatten
      return addends if numbers[0] == target

      find_contiguous_addends(target, numbers, addends) if numbers[0] < target
    end

    def valid_addends(potential_addends, target)
      potential_addends.map do |addend|
        available_addends = potential_addends - [addend]
        addend if available_addends.include? target - addend
      end.compact
    end
  end
end
