module DaySix
  class Redistributor
    def initialize(input)
      @blocks = input.split(' ').map(&:to_i)
      @outcomes = []
    end

    def part_one
      until @outcomes.include?(@blocks) do
        @outcomes << @blocks.dup
        redist_val = @blocks.max
        redist_index = @blocks.index(redist_val)
        @blocks[redist_index] = 0
        redistribute(redist_index, redist_val)
      end
      @outcomes.length
    end

    private

    def redistribute(prev_index, value)
      length = @blocks.length
      next_index = prev_index == length - 1 ? 0 : prev_index + 1
      @blocks[next_index] += 1
      value -= 1
      redistribute(next_index, value) unless value == 0
    end
  end
end
