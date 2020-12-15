# frozen_string_literal: true

class Aoc2020
  class Day5
    attr_accessor :input

    def initialize(input)
      @input = input.split("\n").map(&:strip)
    end

    def boarding_passes
      @boarding_passes ||= input.map do |bp_code|
        column = decode_column(bp_code)
        row = decode_row(bp_code)
        seat_id = row * 8 + column
        {
          column: column,
          row: row,
          seat_id: seat_id
        }
      end
    end

    def part_one
      boarding_passes.max_by { |pass| pass[:seat_id] }.fetch(:seat_id)
    end

    def part_two
      seats = boarding_passes.sort_by { |pass| pass[:seat_id] }
      # drop all entries from first and last row
      seats = remove_first_and_last_rows(seats)
      # find the two entries where y - x == 2
      find_last_empty_seat(seats)
    end

    private

    def remove_first_and_last_rows(rows)
      rows = rows.reject { |pass| pass[:row] == rows.first[:row] }
      rows.reject { |pass| pass[:row] == rows.last[:row] }
    end

    def find_last_empty_seat(seats)
      seats = seats.each_cons(2).map do |first, second|
        first[:seat_id] + 1 if second[:seat_id] - first[:seat_id] == 2
      end.compact
      raise Error, 'multiple empty seats' unless seats.count == 1

      seats[0]
    end

    def decode_row(bp_code)
      search_partitions('F', 'B', 0..127, bp_code[0..6])
    end

    def decode_column(bp_code)
      search_partitions('L', 'R', 0..7, bp_code[7..])
    end

    def search_partitions(lower_key, upper_key, partition_space, code)
      entries = partition_space.to_a
      code.split('').each do |partition|
        lower, upper = binary_partitions(entries)
        entries = lower if partition == lower_key
        entries = upper if partition == upper_key
      end
      raise Error, 'did not reduce to single entry' unless entries.count == 1

      entries[0]
    end

    def binary_partitions(range)
      midpoint = range.count / 2 - 1
      [range[0..midpoint], range[(midpoint + 1)..]]
    end
  end
end
