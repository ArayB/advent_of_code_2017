module DayTen
  class KnotHash
    def part_one(elements, lengths)
      current_position = 0
      skip_size = 0
      lengths.each do |val|
        elements.rotate!(current_position)
        section = elements.shift(val)
        elements = section.reverse + elements
        elements.rotate!(-current_position)
        current_position += (val + skip_size)
        skip_size += 1
      end
      elements.shift(2).inject(:*)
    end

    def part_two(elements, lengths)
      suffix = [17, 31, 73, 47, 23]
      current_position = 0
      skip_size = 0

      lengths_sequence = lengths.chars.map(&:ord) + suffix

      64.times do
        lengths_sequence.each do |val|
          elements.rotate!(current_position)
          section = elements.shift(val)
          elements = section.reverse + elements
          elements.rotate!(-current_position)
          current_position += (val + skip_size)
          skip_size += 1
        end
      end

      sparse_hash = elements.dup
      dense_hash_array = []

      16.times do
        block = sparse_hash.shift(16)
        dense_hash_array << block.inject(:^)
      end

      # convert to hex values
      dense_hash = dense_hash_array.map { |x| "%02x" % x }
      dense_hash.join('')
    end
  end
end
