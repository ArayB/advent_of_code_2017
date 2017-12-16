module DaySixteen
  class Dancing
    def initialize(instructions, programs)
      @programs = programs.chars
      @instructions = instructions
    end

    def part_one
      @instructions.chomp.split(',').each do |i|
        move = i[0]
        i[0] = ''
        case move
        when 's'
          spin(i.to_i)
        when 'x'
          exchange(i)
        when 'p'
          partner(i)
        end
      end
      @programs.join
    end

    def part_two
      seen = false
      values = [@programs.join]
      while !seen
        @instructions.chomp.split(',').each do |instr|
          i = instr.dup
          move = i[0]
          i[0] = ''
          case move
          when 's'
            spin(i.to_i)
          when 'x'
            exchange(i)
          when 'p'
            partner(i)
          end
        end

        new_value = @programs.join

        if values.include?(new_value)
          seen = true
          break
        end
        values << new_value
      end

      values[1_000_000_000 % values.length]
    end

    private

    def spin(amount)
      @programs.rotate!(-amount)
    end

    def exchange(instruction)
      indices = instruction.split('/').map { |l| l.to_i }
      a = @programs[indices.first]
      b = @programs[indices.last]
      @programs[indices.last] = a
      @programs[indices.first] = b
    end

    def partner(instruction)
      values = instruction.split('/')
      index1 = @programs.index(values.first)
      index2 = @programs.index(values.last)
      @programs[index1] = values.last
      @programs[index2] = values.first
    end
  end
end
