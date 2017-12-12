require 'rspec'
require_relative '../../lib/day_seven/towers.rb'

RSpec.describe DaySeven::Towers do
  describe '#part_one' do
    it 'returns correctly' do
      input = File.read('spec/day_seven/test_input.txt')
      expect(DaySeven::Towers.new(input).part_one).to eq('tknk')
    end
    it 'returns correctly' do
      input = File.read('spec/day_seven/test_input.txt')
      expect(DaySeven::Towers.new(input).part_one).to eq('tknk')
    end

    it 'solves' do
      input = File.read('spec/day_seven/input.txt')
      expect(DaySeven::Towers.new(input).part_one).to eq('mwzaxaj')
    end
  end

  describe '#part_two' do
    it 'returns correctly' do
      input = File.read('spec/day_seven/test_input.txt')
      expect(DaySeven::Towers.new(input).part_two).to eq(60)
    end

    it 'returns correctly' do
      input = File.read('spec/day_seven/test_input2.txt')
      expect(DaySeven::Towers.new(input).part_two).to eq(61)
    end

    it 'solves' do
      input = File.read('spec/day_seven/input.txt')
      expect(DaySeven::Towers.new(input).part_two).to eq(1219)
    end
  end
end
