require 'rspec'
require_relative '../../lib/day_fifteen/generators.rb'

RSpec.describe DayFifteen::Generators do
  describe '#part_one' do
    it 'returns correctly' do
      initial_a = 65
      initial_b = 8921

      expect(DayFifteen::Generators.new(initial_a, initial_b).part_one).to eq(588)
    end

    it 'solves' do
      initial_a = 703
      initial_b = 516

      expect(DayFifteen::Generators.new(initial_a, initial_b).part_one).to eq(594)
    end
  end

  describe '#part_two' do
    it 'returns correctly' do
      initial_a = 65
      initial_b = 8921

      expect(DayFifteen::Generators.new(initial_a, initial_b).part_two).to eq(309)
    end

    it 'solves' do
      initial_a = 703
      initial_b = 516

      expect(DayFifteen::Generators.new(initial_a, initial_b).part_two).to eq(328)
    end
  end
end
