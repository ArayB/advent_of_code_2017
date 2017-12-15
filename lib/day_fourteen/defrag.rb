module DayFourteen
  class Defrag
    def part_one(input)
      hash_inputs = (0..127).map{ |x| "#{input}-#{x}" }

      hash_inputs.map{ |f| knot_hash(f) }.map{ |kh| kh.chars.map { |s| s.hex.to_s(2).rjust(s.size*4, '0') } }.join.gsub('0', '').length
    end

    def part_two(input)
      hash_inputs = (0..127).map{ |x| "#{input}-#{x}" }

      @grid = hash_inputs.map{ |f| knot_hash(f) }.map{ |kh| kh.chars.map { |s| s.hex.to_s(2).rjust(s.size*4, '0') }.join.chars }

      @group_val = 0
      @grid.each_with_index do |row, row_index|
        row.each_with_index do |val, char_index|
          if @grid[row_index][char_index] == "1"
            build_group([row_index, char_index])
            @group_val += 1
          end
        end
      end

      # require 'csv'
      # CSV.open('grid.csv', 'wb') do |csv|
      #   @grid.each do |g|
      #     csv << g
      #   end
      # end

      @group_val
    end

    def build_group(coords, group=[])
      group << coords
      row = coords[0]
      index = coords[1]
      @grid[row][index] = @group_val

      contiguous_filled = [[row + 1, index], [row - 1, index], [row, index + 1], [row, index -1]]
                            .select{ |x, y| x >= 0 && x <= 127 && y >= 0 && y <= 127 }
                            .select{ |x, y| @grid[x][y] == "1" }
                            .select { |x| !group.include?(x) }
      contiguous_filled.each do |coord|
        group = build_group(coord, group)
      end
      group
    end

    def knot_hash(lengths)
      elements = (0..255).to_a
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
