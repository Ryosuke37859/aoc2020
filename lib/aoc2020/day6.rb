# frozen_string_literal: true

class Aoc2020
  class Day6
    attr_accessor :input

    def initialize(input)
      # split by group, then split by individual respondent
      @input = input.split("\n\n").map { |line| line.split("\n").map(&:strip) }
    end

    def group_unique_answers
      @group_unique_answers ||= input.map do |entry|
        entry.flat_map { |answers| answers.split('') }.uniq
      end
    end

    def group_unanimous_answers
      @group_unanimous_answers ||= input.map do |entry|
        entry.map { |answers| answers.split('') }.inject(&:intersection)
      end
    end

    def part_one
      group_unique_answers.map(&:count).inject(&:+)
    end

    def part_two
      group_unanimous_answers.map(&:count).inject(&:+)
    end
  end
end
