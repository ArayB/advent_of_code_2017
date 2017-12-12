module DaySeven
  class Program
    attr_accessor :name, :weight, :holding

    def initialize(program_arr, all_programs_arr)
      @name = program_arr[0]
      @weight = program_arr[1].to_i

      if program_arr[2]
        @holding = []
        holding_arr = program_arr[2]
        holding_arr.each do |held|
          program_arr = all_programs_arr.select{ |p| p[0] == held }.first

          @holding << Program.new(program_arr, all_programs_arr)
        end
      end
    end

    def holding_weight
      return 0 unless @holding
      @holding.map{ |held| held.total_weight }.sum
    end

    def total_weight
      @weight + holding_weight
    end

    def balance_to(desired_weight)
      diff = desired_weight - total_weight

      return weight + diff if @holding.nil?

      held_weights = @holding.map{ |held| held.total_weight }
      if held_weights.uniq.length == 1
        weight + diff
      else
        unbalanced_total = held_weights.group_by(&:itself).map { |k, v| [k, v.length] }.select{ |x| x[1] == 1 }.first[0]
        held_weights.delete_at(held_weights.index(unbalanced_total))
        balanced_total = held_weights.first
        @holding.select{ |p| p.total_weight == unbalanced_total }.first.balance_to(balanced_total)
      end
    end
  end

  class Towers
    def initialize(input)
      @lines = input.split("\n")
    end

    def part_one
      bottom_program_name
    end

    def part_two
      program_arrs = []
      @lines.each do |line|
        program = []
        parts = line.split('->')
        program_string = parts.first.gsub('(', '').gsub(')', '').split(' ')

        program[0] = program_string[0]
        program[1] = program_string[1].to_i
        if parts.length > 1
          program[2] = parts.last.gsub(' ', '').split(',').flatten
        end
        program_arrs << program
      end

      bottom_program = program_arrs.select{ |p| p[0] == bottom_program_name }.first
      tower_bases = program_arrs.select{ |p| bottom_program[2].include?(p[0]) }

      programs = []
      tower_bases.each do |base|
        programs << Program.new(base, program_arrs)
      end

      weights = programs.map { |p| p.total_weight }
      unbalanced_total = weights.group_by(&:itself).map { |k, v| [k, v.length] }.select{ |x| x[1] == 1 }.first[0]
      weights.delete_at(weights.index(unbalanced_total))
      balanced_total = weights.first
      programs.select{ |p| p.total_weight == unbalanced_total }.first.balance_to(balanced_total)
    end

    private

    def bottom_program_name
      programs = []
      held = []
      @lines.each do |line|
        parts = line.split('->')
        programs << parts.first.split(' ').first
        if parts.length > 1
          held += parts.last.gsub(' ', '').split(',').flatten
        end
      end
      (programs - held).first
    end
  end
end
