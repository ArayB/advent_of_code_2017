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
      value.times do |x|
        shift = x + 1
        @blocks = @blocks.rotate(shift)
        @blocks[index] += 1
        @blocks = @blocks.rotate(-shift)
      end
    end
  end
end
