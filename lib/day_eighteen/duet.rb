module DayEighteen
  class Duet
    def part_one(input)
      registers = Hash[('a'..'p').zip(('a'..'p').map{|x| 0})]
      played = []

      instructions = input.chomp.split("\n")
      index = 0
      running = true
      while running == true && index >= 0 && index < instructions.length - 1
        instr = instructions[index]
        vals = instr.split(' ')[1..3]
        string_val = ('a'..'z').include?(vals[1])
        register = registers[vals[0]]
        case instr.split(' ')[0]
        when "snd"
          puts "played: #{registers[vals[0]]}"
          played << registers[vals[0]]
          index += 1
        when "set"
          if string_val
            registers[vals[0]] = registers[vals[1]]
          else
            registers[vals[0]] = vals[1].to_i
          end
          index += 1
        when "add"
          if string_val
            registers[vals[0]] += registers[vals[1]]
          else
            registers[vals[0]] += vals[1].to_i
          end
          index += 1
        when "mul"
          if string_val
            registers[vals[0]] = registers[vals[0]] * registers[vals[1]]
          else
            registers[vals[0]] = registers[vals[0]] * vals[1].to_i
          end
          index += 1
        when "mod"
          if string_val
            registers[vals[0]] = registers[vals[0]] % registers[vals[1]]
          else
            registers[vals[0]] = registers[vals[0]] % vals[1].to_i
          end
          index += 1
        when "rcv"
          if played.last != 0
            running = false
          end
          index += 1
        when "jgz"
          if registers[vals[0]] > 0
            index = index + vals[1].to_i
          else
            index += 1
          end
        end
      end
      played.last
    end
  end
end
