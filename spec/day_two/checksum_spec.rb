require 'rspec'
require_relative '../../lib/day_two/checksum.rb'

RSpec.describe DayTwo::Checksum do
  describe '#sum_differences' do
    it 'returns correctly' do
      input = <<~END
        5 1 9 5
        7 5 3
        2 4 6 8
 END

      expect(DayTwo::Checksum.new(input).sum_differences).to eq(18)
    end
  end

  describe '#evenly_divisible_values' do
    it 'returns correctly' do
      input = <<~EOS
        5 9 2 8
        9 4 7 3
        3 8 6 5
EOS

      expect(DayTwo::Checksum.new(input).evenly_divisible_values).to eq(9)
    end
  end
end
