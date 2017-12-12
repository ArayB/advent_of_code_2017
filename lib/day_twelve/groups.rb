module DayTwelve
  class Groups
    def initialize(input)
      @input = input.chomp.gsub("<->", '').gsub(',', '').split("\n").map{ |x| x.split(' ').map { |y| y.to_i } }
      @groups = []
    end

    def part_one
      build_groups
      @groups.select{ |g| g.include?(0) }.first.length
    end

    def part_two
      build_groups
      @groups.length
    end

    private

    def build_groups
      @input.each do |i|
        poss_groups = @groups.select{ |g| (g & i).any? }
        group = poss_groups.flatten
        poss_groups.map { |pg| @groups.delete_at(@groups.index(pg)) }
        @groups << if group
                     (group + i).uniq
                   else
                     i.uniq
                   end
      end
    end
  end
end
