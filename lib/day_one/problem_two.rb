module DayOne
  class Problem2
    def initialize(input)
      @arr = input.split('').map { |val| val.to_i }
      @arr_length = @arr.length
      @step = input.length / 2
    end

    def run
      pairs = @arr.each_with_index.map { |val, index| [val, @arr[compare_index(index)]] }
      pairs.select { |first, last| first == last }.flatten.sum / 2
    end

    private

    def compare_index(index)
      new_index = index + @step
      return new_index if new_index < @arr_length
      new_index - @arr_length
    end
  end
end
