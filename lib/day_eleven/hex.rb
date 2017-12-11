module DayEleven
  class Hex
    def initialize(input)
      @steps = input.chomp.split(',')
      @position = [0,0,0]
    end

    def part_one
      @steps.each do |step|
        case step
        when 'n'
          adjust_position([0,1,-1])
        when 'ne'
          adjust_position([1,0,-1])
        when 'nw'
          adjust_position([-1,1,0])
        when 's'
          adjust_position([0,-1,1])
        when 'se'
          adjust_position([1,-1,0])
        when 'sw'
          adjust_position([-1,0,1])
        end
      end

      return @position.map{ |x| x.abs }.max
    end

    def part_two
      distances = []
      @steps.each do |step|
        case step
        when 'n'
          adjust_position([0,1,-1])
        when 'ne'
          adjust_position([1,0,-1])
        when 'nw'
          adjust_position([-1,1,0])
        when 's'
          adjust_position([0,-1,1])
        when 'se'
          adjust_position([1,-1,0])
        when 'sw'
          adjust_position([-1,0,1])
        end

        distances << @position.map{ |x| x.abs }.max
      end

      distances.max
    end

    private

    def adjust_position(vector)
      @position = [@position.first + vector.first, @position[1] + vector[1], @position.last + vector.last]
    end
  end
end
