module DayEight
  class Registers
    INSTR_REGEX = /^(?<register>\w+) (?<jump_dir>\w+) (?<jump_val>[-]?\d+) if (?<cond_register>\w+) (?<cond_constraint>\S{1,2}) (?<cond_val>[-]?\d+)/

    def initialize(input)
      @instructions = input.split("\n")
      @registers = @instructions.map { |line| { name: line.split(' ').first, value: 0 } }.uniq
    end

    def part_one
      @instructions.each do |instruction_string|
        instructions = INSTR_REGEX.match(instruction_string)
        register = @registers.select{ |r| r[:name] == instructions[:register] }.first

        conditional_register = @registers.select{ |r| r[:name] == instructions[:cond_register] }.first

        if conditional_register[:value].send(instructions[:cond_constraint], instructions[:cond_val].to_i)
          if instructions[:jump_dir] == 'inc'
            new_value = register[:value] + instructions[:jump_val].to_i
            register[:value] = new_value
          else
            new_value = register[:value] - instructions[:jump_val].to_i
            register[:value] = new_value
          end
        end
      end

      @registers.map{ |r| r[:value] }.max
    end

    def part_two
      max = 0
      @instructions.each do |instruction_string|
        instructions = INSTR_REGEX.match(instruction_string)
        register = @registers.select{ |r| r[:name] == instructions[:register] }.first

        conditional_register = @registers.select{ |r| r[:name] == instructions[:cond_register] }.first

        if conditional_register[:value].send(instructions[:cond_constraint], instructions[:cond_val].to_i)
          if instructions[:jump_dir] == 'inc'
            new_value = register[:value] + instructions[:jump_val].to_i
            max = new_value if new_value > max
            register[:value] = new_value
          else
            new_value = register[:value] - instructions[:jump_val].to_i
            max = new_value if new_value > max
            register[:value] = new_value
          end
        end
      end

      max
    end
  end
end
