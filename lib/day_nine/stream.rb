module DayNine
  class Stream
    def initialize(input)
      @stream = input.split('')
      @negated = false
      @garbage = false
      @group_score = 0
      @total_score = 0
      @garbage_char_count = 0
    end

    def part_one
      process
      @total_score
    end

    def part_two
      process
      @garbage_char_count
    end

    private

    def process
      @stream.each do |char|
        if @negated
          @negated = false
          next
        end

        if char == '!'
          @negated = true
          next
        end

        if @garbage
          if char == '>'
            @garbage = false
          else
            @garbage_char_count += 1
          end
          next
        end

        if char == '{'
          @group_score += 1
          @total_score += @group_score
        elsif char == '}'
          @group_score -= 1
        elsif char == '<'
          @garbage = true
        end
      end
    end
  end
end
