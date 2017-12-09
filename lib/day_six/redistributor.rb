module DaySix
  class Redistributor
    def initialize(input)
      @blocks = input.split(' ').map(&:to_i)
      @outcomes = []
    end

    def part_one
      process
      @outcomes.length
    end

    def part_two
      process
      index = @outcomes.index(@blocks)
      @outcomes.length - index
    end

    private

    def process
      until @outcomes.include?(@blocks) do
        @outcomes << @blocks.dup
        redist_val = @blocks.max
        redist_index = @blocks.index(redist_val)
        @blocks[redist_index] = 0
        redistribute(redist_index, redist_val)
      end
    end

    def redistribute(index, value)
      temp_value = value
      while temp_value > 0 do
        @blocks = @blocks.rotate(1)
        @blocks[index] += 1
        temp_value -= 1
      end

      @blocks = @blocks.rotate(-value)
    end
  end
end
