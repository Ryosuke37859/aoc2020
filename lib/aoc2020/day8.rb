# frozen_string_literal: true

class Aoc2020
  class Day8
    attr_accessor :input

    def initialize(input)
      @input = input.split("\n").map(&:strip).map(&:split)
      @instructions = @input.map { |op, arg| [op.to_sym, arg.to_i] }
      initialize_registers
    end

    def repair_corrupted_instruction
      return nil unless will_loop?(@instructions)

      history = @history.dup
      next_edit = 0
      while will_loop?(instructions ||= @instructions)
        pointer, pointer_index = find_next_jmp_or_nop(history[next_edit..])
        instructions = @instructions.map(&:dup)
        instructions[pointer][0] = instructions[pointer][0] == :jmp ? :nop : :jmp
        next_edit = [next_edit + 1, pointer_index].max
      end
      @instructions = instructions
    end

    def part_one
      will_loop?(@instructions)
      @accumulator
    end

    def part_two
      repair_corrupted_instruction
      @accumulator
    end

    private

    def acc(arg)
      @accumulator += arg
      @next_instruction += 1
    end

    def find_next_jmp_or_nop(pointers)
      pointers.each_with_index do |pointer, index|
        return [pointer, index] if %i[jmp nop].include? @instructions[pointer][0]
      end
    end

    def initialize_registers
      @history = []
      @accumulator = 0
      @next_instruction = 0
    end

    def jmp(arg)
      @next_instruction += arg
    end

    def nop(_arg)
      @next_instruction += 1
    end

    def will_loop?(instructions)
      initialize_registers
      while instructions[@next_instruction]
        op, arg = instructions[@next_instruction]
        return true if @history.include? @next_instruction

        @history.append(@next_instruction)
        send(op, arg)
      end
      false
    end
  end
end
