module DayOne
  class Problem1
    def initialize(input)
      @arr = input.split('').map { |x| x.to_i }
      @matches = []
    end

    def run
      process(@arr)
      @matches.sum
    end

    def process(arr, last = nil)
      head, *tail = arr
      if head == last
        @matches << head
      end

      return process(tail, head) unless tail.length.zero?
      @matches << @arr.last if @arr.last == @arr.first
    end
  end
end
