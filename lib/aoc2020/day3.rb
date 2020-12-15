# frozen_string_literal: true

class Aoc2020
  class Day3
    attr_accessor :input

    def initialize(input)
      @input = input.map(&:chomp)
      @row_length = @input.first.length
      @x = 0
      @y = 0
    end

    def part_one
      @part_one ||= count_trees(slope_x: 3, slope_y: 1)
    end

    def part_two
      slopes = [
        { slope_x: 1, slope_y: 1 },
        { slope_x: 5, slope_y: 1 },
        { slope_x: 7, slope_y: 1 },
        { slope_x: 1, slope_y: 2 }
      ]
      tree_counts = slopes.map { |slope| count_trees(**slope) }
      tree_counts << part_one
      tree_counts.inject(:*)
    end

    private

    def count_trees(slope_x:, slope_y:)
      trees = 0
      until reached_bottom?
        trees += 1 if @input[@y][@x] == '#'
        traverse(x_pos: slope_x, y_pos: slope_y)
      end
      @x = 0
      @y = 0
      trees
    end

    def traverse(x_pos:, y_pos:)
      @x = (@x + x_pos) % @row_length
      @y += y_pos
    end

    def reached_bottom?
      @y >= input.length
    end
  end
end
