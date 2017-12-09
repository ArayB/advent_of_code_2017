require 'rspec'
require_relative '../../lib/day_eight/registers.rb'

RSpec.describe DayEight::Registers do
  describe '#part_one' do
    it 'returns correctly' do
      input = File.read('spec/day_eight/test_input.txt')
      expect(DayEight::Registers.new(input).part_one).to eq(1)
    end

    it 'solves' do
      input = File.read('spec/day_eight/input.txt')
      expect(DayEight::Registers.new(input).part_one).to eq(5075)
    end
  end

  describe '#part_one' do
    it 'returns correctly' do
      input = File.read('spec/day_eight/test_input.txt')
      expect(DayEight::Registers.new(input).part_two).to eq(10)
    end

    it 'solves' do
      input = File.read('spec/day_eight/input.txt')
      expect(DayEight::Registers.new(input).part_two).to eq(7310)
    end
  end
end
