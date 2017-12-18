module DaySeventeen
  class Spinlock
    def part_one(steps, insertions)
      buffer = [0]

      (1..insertions).each do |val|
        buffer.rotate!(steps)
        buffer.insert(val, val)
        # puts buffer.to_s
      end
      buffer[0]
    end
  end

  def part_two(steps, insertions)

  end
end
