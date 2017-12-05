module DayFive
  class Jump
    def initialize(input)
      @maze = input.split("\n").map(&:to_i)
      @position = 0
      @jumps = 0
    end

    def run
      until @maze[@position].nil? do
        current_position = @position
        @position = current_position + @maze[current_position]
        @maze[current_position] += 1
        @jumps += 1
      end
      @jumps
    end

    def part2
      until @maze[@position].nil? do
        current_position = @position
        current_value = @maze[current_position]
        @position = current_position + current_value
        current_value >= 3 ? @maze[current_position] -= 1 : @maze[current_position] += 1
        @jumps += 1
      end
      @jumps
    end
  end
end
