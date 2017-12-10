require 'rspec'
require_relative '../../lib/day_ten/knot_hash.rb'

RSpec.describe DayTen::KnotHash do
  describe '#part_one' do
    it 'returns corectly for short input' do
      elements = (0..4).to_a
      lengths = [3,4,1,5]

      expect(DayTen::KnotHash.new.part_one(elements, lengths)).to eq(12)
    end

    it 'solves' do
      elements = (0..255).to_a
      lengths = [76,1,88,148,166,217,130,0,128,254,16,2,130,71,255,229]
      expect(DayTen::KnotHash.new.part_one(elements, lengths)).to eq(29240)
    end
  end

  describe '#part_two' do
    it 'returns corectly for short input' do
      elements = (0..255).to_a
      lengths = '1,2,3'
      expect(DayTen::KnotHash.new.part_two(elements, lengths)).to eq('3efbe78a8d82f29979031a4aa0b16a9d')
    end

    it 'returns corectly for short input' do
      elements = (0..255).to_a
      lengths = '1,2,4'
      expect(DayTen::KnotHash.new.part_two(elements, lengths)).to eq('63960835bcdc130f0b66d7ff4f6a5a8e')
    end

    it 'solves' do
      elements = (0..255).to_a
      lengths = '76,1,88,148,166,217,130,0,128,254,16,2,130,71,255,229'
      expect(DayTen::KnotHash.new.part_two(elements, lengths)).to eq('4db3799145278dc9f73dcdbc680bd53d')
    end
  end
end
