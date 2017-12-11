module DayEleven
  class Hex
    def initialize(input)
      @steps = input.split(',')
      @position = [0,0]
    end

    def part_one
      @steps.each do |step|
        # puts step
        case step
        when 'ne'
          adjust_position([1,1])
        when 'nw'
          adjust_position([-1,1])
        when 'n'
          adjust_position([0,1])
        when 'sw'
          adjust_position([-1,-1])
        when 'se'
          adjust_position([1,-1])
        when 's'
          adjust_position([0,-1])
        else
          puts @position.to_s
          puts 'hmmmmmm'
        end

      end

      puts @position.to_s
      return @position.map{ |x| x.abs }.max
    end

    private

    def adjust_position(vector)
      @position = [@position.first + vector.first, @position.last + vector.last]
    end
  end
end
