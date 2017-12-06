require 'rspec'
require_relative '../../lib/day_three/spiral_distance.rb'

RSpec.describe DayThree::SpiralDistance do
  describe '#run' do

    it 'returns 3 for input of 12' do
      expect(DayThree::SpiralDistance.new(12).run).to eq(3)
    end

    it 'returns 2 for input of 23' do
      expect(DayThree::SpiralDistance.new(23).run).to eq(2)
    end

    it 'returns 31 for input of 1024' do
      expect(DayThree::SpiralDistance.new(1024).run).to eq(31)
    end

    it 'solves' do
      expect(DayThree::SpiralDistance.new(312051).run).to eq(31)
    end
  end
end
