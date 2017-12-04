module DayFour
  class Passphrase
    def initialize(input)
      rows = input.split("\n")
      @phrases = rows.map { |row| row.split(' ') }
    end

    def total_valid
      @phrases.select { |row_arr| row_arr.length == row_arr.uniq.length }.length
    end

    def total_anagram_valid
      ordered_phrases = @phrases.map { |row_arr| row_arr.map { |x| x.split('').sort.join('') } }
      ordered_phrases.select { |row_arr| row_arr.length == row_arr.uniq.length }.length
    end
  end
end
