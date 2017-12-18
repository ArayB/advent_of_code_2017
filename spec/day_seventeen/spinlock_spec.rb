require 'rspec'
require_relative '../../lib/day_seventeen/spinlock.rb'

RSpec.describe DaySeventeen::Spinlock do
  describe '#part_one' do
    it 'returns correctly for short input' do
      steps = 3
      expect(DaySeventeen::Spinlock.new.part_one(steps, 9)).to eq(5)
    end

    it 'returns correctly for long input' do
      steps = 3
      expect(DaySeventeen::Spinlock.new.part_one(steps, 2017)).to eq(638)
    end

    it 'solves' do
      steps = 328
      expect(DaySeventeen::Spinlock.new.part_one(steps, 2017)).to eq(1670)
    end
  end
end
