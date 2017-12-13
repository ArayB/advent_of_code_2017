module DayThirteen
  class Layer
    attr_accessor :depth, :range

    def initialize(depth, range)
      @depth = depth
      @private_range = range
      @scanner_position = 1
      @scanner_direction = :out
    end

    def to_s
      arr = []
      if @private_range.nil?
        arr << '...'
      else
        (1..@private_range).each do |r|
          if r == @scanner_position
            arr << '[S]'
          else
            arr << '[]'
          end
        end
      end
      "#{depth}: #{arr}"
    end

    def severity
      return @depth * @private_range if caught?
      0
    end

    def caught?
      return false if @private_range.nil?
      @scanner_position == 1
    end

    def advance_scanner
      return if @private_range.nil?
      if @scanner_direction == :out
        if @scanner_position == @private_range
          @scanner_direction = :back
          @scanner_position -= 1
        else
          @scanner_position += 1
        end
      else
        if @scanner_position == 1
          @scanner_direction = :out
          @scanner_position += 1
        else
          @scanner_position -= 1
        end
      end
    end

    def reset_scanner
      return if @private_range.nil?
      @scanner_position = 1
      @scanner_direction = :out
    end
  end

  class Severity
    def initialize(input)
      @input = input.chomp.split("\n").map { |x| x.split(": ").map{ |y| y.to_i } }
      max_layer = @input.map{ |l| l[0] }.max

      @layers = []
      (0..max_layer).each do |depth|
        range = nil
        layer = @input.select{ |d, r| d == depth }.first

        range = layer.last if layer
        @layers << Layer.new(depth, range)
      end
      @scanner_count = @layers.length
    end

    def part_one
      severity = 0

      (0..@scanner_count - 1).each do |depth|
        puts @layers.map{ |l| l.to_s }
        packet_position = depth
        layer = @layers.select{ |l| l.depth == packet_position }.first
        severity += layer.severity
        advance_scanners
      end
      severity
    end

    def part_one_a
      @input.map { |entry| entry[0] % (2 * (entry[1] - 1)) == 0 ? entry[0] * entry[1] : 0 }.sum
    end

    def part_two_a
      # brute for takes so unbelievably long I went to look for a better solution
      # this is so simple.
      # In future take some time to think about how the problem could be solved instead of just jumping in to doing it literally
      delay = 0
      while @input.select { |entry| (entry[0] + delay) % (2 * (entry[1] - 1)) == 0 }.any?
        delay += 1
      end
      delay
    end

    def part_two
      escaped = false
      delay = 0

      while !escaped
        reset_scanners
        (0..delay).each do
          advance_scanners
        end

        caught = false
        (0..@scanner_count - 1).each do |depth|
          break if caught
          packet_position = depth
          layer = @layers.select{ |l| l.depth == packet_position }.first
          if layer.caught?
            caught = true
          end
          break if caught
          advance_scanners
        end

        if !caught
          escaped = true
        else
          delay += 1
        end
      end

      delay + 1
    end

    def advance_scanners
      @layers.each { |layer| layer.advance_scanner }
    end

    def reset_scanners
      @layers.each { |layer| layer.reset_scanner }
    end

    def print_scanner_position
      puts '======================================================'
      puts 'scanners'
      puts '======================================================'
      puts @layers.map{ |l| l.to_s }
    end
  end
end
