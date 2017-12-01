module DayOne
  class ArrayPairMatcher
    def initialize(input, step)
      @arr = input.split('').map { |x| x.to_i }
      @step = step
    end

    def run
      rotated = @arr.rotate(@step)
      @arr.zip(rotated).select { |first, last| first == last }.flatten.sum / 2
    end
  end
end
