module DaySeven
  class Towers
    def initialize(input)
      @lines = input.split("\n")
    end

    def part_one
      bottom_program_name
    end

    def part_two
      programs = []
      @lines.each do |line|
        parts = line.split('->')
        program_string = parts.first.gsub('(', '').gsub(')', '').split(' ')
        program_hash = { name: program_string[0], weight: program_string[1].to_i }
        if parts.length > 1
          program_hash[:holding] = parts.last.gsub(' ', '').split(',').flatten
        end
        programs << program_hash
      end

      programs.select { |p| !p[:holding].nil? }.each do |program|
        puts program[:name]
        program[:holding] = program[:holding].map { |h| programs.select { |p| p[:name] == h }.first }

        program[:total_weight] = program[:weight] + program[:holding].sum { |h| h[:weight] }
      end

      total_weights = programs.select{ |p| p[:name] != bottom_program_name }.map { |p| p[:total_weight] }.compact
      puts total_weights.to_s

      unbalanced_total = total_weights.group_by(&:itself).map { |k, v| [k, v.length] }.select{ |x| x[1] == 1 }.first[0]
      balanced_total = total_weights.uniq.select { |w| w != unbalanced_total }.first
      puts "balanced_total: #{balanced_total}"
      puts "unbalanced_total: #{unbalanced_total}"

      unbalanced_program = programs.select{ |p| p[:total_weight] == unbalanced_total }.first
      puts unbalanced_program

      # check all held are same weight
      # if not calculate what new value should be

      # if all held are same weight calculate new program weight
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
