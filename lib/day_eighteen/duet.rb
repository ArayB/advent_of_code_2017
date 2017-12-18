module DayEighteen
  class Duet
    def part_one(input)
      registers = Hash[('a'..'p').zip(('a'..'p').map{|x| 0})]

      input.chomp.split("\n").each do |instr|
        case instr.split(' ')[0]
        when "snd"
        when "set"
        when "add"
        when "mul"
        when "mod"
        when "rcv"
        when "jgz"

        end

      end

      4
    end
  end
end
