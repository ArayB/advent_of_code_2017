require 'rspec'
require_relative '../../lib/day_eleven/hex.rb'

RSpec.describe DayEleven::Hex do
  describe '#part_one' do
    it 'returns correctly for "ne,ne,ne"' do
      input = "ne,ne,ne"
      expect(DayEleven::Hex.new(input).part_one).to eq(3)
    end

    it 'returns correctly for "ne,ne,sw,sw"' do
      input = "ne,ne,sw,sw"
      expect(DayEleven::Hex.new(input).part_one).to eq(0)
    end

    it 'returns correctly for "ne,ne,s,s"' do
      input = "ne,ne,s,s"
      expect(DayEleven::Hex.new(input).part_one).to eq(2)
    end

    it 'returns correctly for "se,sw,se,sw,sw"' do
      input = 'se,sw,se,sw,sw'
      expect(DayEleven::Hex.new(input).part_one).to eq(3)
    end

    it 'solves' do
      input = File.read('spec/day_eleven/input.txt')
      expect(DayEleven::Hex.new(input).part_one).to eq(794)
    end
  end
end
