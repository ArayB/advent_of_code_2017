module DayThree
  class SpiralDistance
    def initialize(input)
      @value = input
    end

    def run
      root = Math.sqrt(@value).floor
      lower_corner_root =  root.even? ? root - 1 : root
      upper_corner_root = lower_corner_root + 2
      lower_corner = (lower_corner_root * lower_corner_root)
      upper_corner = (upper_corner_root * upper_corner_root)

      spiral_side_length = (upper_corner - lower_corner) / 4
      puts "spiral_side_length: #{spiral_side_length}"
      corners = (1..4).to_a.map { |x| lower_corner + (x * spiral_side_length) }
      puts corners.to_s

      nearest_low_corner = corners.reverse.find { |e| e < @value }
      nearest_high_corner = corners.find { |e| e > @value }
      puts "nearest_low_corner: #{nearest_low_corner}"
      puts "nearest_high_corner: #{nearest_high_corner}"

      compare_corner = if nearest_low_corner.nil?
                         nearest_high_corner
                       elsif nearest_high_corner.nil?
                         nearest_low_corner
                       else
                         high_diff = nearest_high_corner - @value
                         low_diff = @value - nearest_low_corner
                         high_diff >= low_diff ? nearest_low_corner : nearest_high_corner
                       end

      diff = (@value - compare_corner).abs
      puts "diff: #{diff}"
      spiral_side_length - diff
    end

  end
end
