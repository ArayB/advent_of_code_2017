require 'rspec'
require_relative '../../lib/day_five/jump.rb'

RSpec.describe DayFive::Jump do
  describe '#run' do
    it 'returns correctly' do
      input = File.read('spec/day_five/input1.txt')
      expect(DayFive::Jump.new(input).run).to eq(5)
    end
  end

  describe '#part2' do
    it 'returns correctly' do
      input = File.read('spec/day_five/input1.txt')
      expect(DayFive::Jump.new(input).part2).to eq(10)
    end
  end
end
