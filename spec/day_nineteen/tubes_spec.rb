require 'rspec'
require_relative '../../lib/day_nineteen/tubes.rb'

RSpec.describe DayNineteen::Tubes do
  describe '#part_one' do
    it 'returns correctly' do
      input = File.read('input/19/short.txt')
      expect(DayNineteen::Tubes.new.part_one(input)).to eq('ABCDEF')
    end

    it 'solves' do
      input = File.read('input/19/input.txt')
      expect(DayNineteen::Tubes.new.part_one(input)).to eq('NDWHOYRUEA')
    end
  end

  describe '#part_two' do
    it 'returns correctly' do
      input = File.read('input/19/short.txt')
      expect(DayNineteen::Tubes.new.part_two(input)).to eq(38)
    end

    it 'solves' do
      input = File.read('input/19/input.txt')
      expect(DayNineteen::Tubes.new.part_two(input)).to eq(17540)
    end
  end
end
