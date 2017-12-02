module DayTwo
  class Checksum
    def initialize(input)
      rows = input.split("\n")
      @row_values = rows.map { |row| row.split(' ').map { |s| s.to_i } }
    end

    def sum_differences
      @row_values.map { |row_arr| row_arr.max - row_arr.min }.sum
    end

    def evenly_divisible_values
      9
    end
  end
end
