require 'rspec'
require_relative '../../lib/day_six/redistributor.rb'

RSpec.describe DaySix::Redistributor do
  describe '#part_one' do
    it 'returns correctly' do
      input = "0 2 7 0"

      expect(DaySix::Redistributor.new(input).part_one).to eq(5)
    end

    it 'solves' do
      input = "4 9 1	8	4"
      expect(DaySix::Redistributor.new(input).part_one).to eq(8)
    end

    it 'solves' do
      input = "14	0 15 12 11 11 3 5	1	6	8	4	9	1	8	4"
      expect(DaySix::Redistributor.new(input).part_one).to eq(11137)
    end
  end

  describe '#part_two' do
    it 'returns correctly' do
      input = "0 2 7 0"

      expect(DaySix::Redistributor.new(input).part_two).to eq(4)
    end

    it 'solves' do
      input = "14	0 15 12 11 11 3 5	1	6	8	4	9	1	8	4"
      expect(DaySix::Redistributor.new(input).part_two).to eq(1037)
    end
  end
end
