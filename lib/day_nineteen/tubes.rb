module DayNineteen
  class Tubes
    def part_one(input)
      run(input)
      @values.join
    end

    def part_two(input)
      run(input)
      @steps
    end

    private

    def run(input)
      @grid = input.chomp.split("\n").map { |line| line.each_char.to_a }

      start_x = @grid[0].index('|')
      @position = { x: start_x, y: 0}
      @direction = :down
      @running = true
      @values = []
      @steps = 0

      while @running
        case current_val
        when '|'
          move
        when '-'
          move
        when '+'
          set_direction
          move
        else
          @values << current_val
          check_finished
          move
        end
      end
    end

    def move
      @steps += 1
      case @direction
      when :down
        @position[:y] += 1
      when :up
        @position[:y] -= 1
      when :left
        @position[:x] -= 1
      when :right
        @position[:x] += 1
      end
    end

    def set_direction
      case @direction
      when :down, :up
        set_horizontal_direction
      when :left, :right
        set_vertical_direction
      end
    end

    def check_finished
      case @direction
      when :down
        @running = false if !value_below?
      when :up
        @running = false if !value_above?
      when :left
        @running = false if !value_left?
      when :right
        @running = false if !value_right?
      end
    end

    def current_val
      @grid[@position[:y]][@position[:x]]
    end

    def set_horizontal_direction
      return @direction = :right if value_right?
      @direction = :left
    end

    def set_vertical_direction
      return @direction = :up if value_above?
      @direction = :down
    end

    def value_above?
      return false if @position[:y].zero?
      return false if @grid[@position[:y] - 1][@position[:x]] == ' '
      return false if @grid[@position[:y] - 1][@position[:x]].nil?
      true
    end

    def value_below?
      return false if @position[:y] == @grid.length - 1
      return false if @grid[@position[:y] + 1][@position[:x]] == ' '
      return false if @grid[@position[:y] + 1][@position[:x]].nil?
      true
    end

    def value_left?
      return false if @position[:x].zero?
      return false if @grid[@position[:y]][@position[:x] - 1] == ' '
      true
    end

    def value_right?
      return false if @position[:x] == @grid[@position[:y]].length - 1
      return false if @grid[@position[:y]][@position[:x] + 1] == ' '
      true
    end
  end
end
