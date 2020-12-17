# frozen_string_literal: true

class Aoc2020
  class Day7
    attr_accessor :input

    def initialize(input)
      @input = input.split("\n").map(&:strip)
    end

    def rules
      @rules ||= input.map { |text| parse_rule(text) }.reduce(&:merge)
    end

    def index
      return @index if @index

      unmerged_indices = rules.map do |outer_bag, inner_bags|
        invert(outer_bag, inner_bags)
      end
      @index ||= unmerged_indices.compact.reduce { |a, b| deep_merge(a, b) }
    end

    def part_one(bag_color)
      count = 0
      seen_bags = []
      # find all bags that can contain bag_color (eligible_bags)
      eligible_bags = index[bag_color]&.keys || []
      until eligible_bags.empty?
        count += eligible_bags.count
        # find all bags that can contain eligible bags, set to eligible_bags
        new_bags = eligible_bags.flat_map { |bag| index[bag]&.keys }.compact.uniq
        seen_bags += eligible_bags
        eligible_bags = new_bags - seen_bags
      end
      count
    end

    def part_two(bag_color)
      count = 0
      nested_bags = bags_for(bag_color)
      until nested_bags.empty?
        count += nested_bags.count
        nested_bags = nested_bags.flat_map { |bag| bags_for(bag) }.compact
      end
      count
    end

    private

    def bags_for(bag_color)
      # return nested bags for a given bag color
      rules[bag_color].flat_map { |color, number| [color] * number }
    end

    def deep_merge(hash_a, hash_b)
      hash_a.merge(hash_b) { |_key, a_value, b_value| a_value.merge(b_value) }
    end

    def invert(outer_bag, inner_bags)
      inner_bags.map { |color, count| { color => { outer_bag => count } } }.reduce(&:merge)
    end

    def parse_rule(text)
      key, values = text.split(' bags contain ')
      values = values.split(', ').map do |value|
        value.match(/(\d+) ([a-z]+ [a-z]+)/)&.captures
      end
      return { key => {} } if values[0].nil?

      values = values.map { |a, b| { b => a.to_i } }.reduce(&:merge)
      { key => values }
    end
  end
end
