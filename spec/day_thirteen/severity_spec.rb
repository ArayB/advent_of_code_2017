require 'rspec'
require_relative '../../lib/day_thirteen/severity.rb'

RSpec.describe DayThirteen::Severity do
  describe '#part_one' do
    it 'solves small input' do
      input = File.read('spec/day_thirteen/test_input.txt')
      expect(DayThirteen::Severity.new(input).part_one).to eq(24)
    end

    it 'solves small input' do
      input = File.read('spec/day_thirteen/test_input.txt')
      expect(DayThirteen::Severity.new(input).part_one_a).to eq(24)
    end

    it 'solves' do
      input = File.read('spec/day_thirteen/input.txt')
      expect(DayThirteen::Severity.new(input).part_one).to eq(1728)
    end

    it 'solves' do
      input = File.read('spec/day_thirteen/input.txt')
      expect(DayThirteen::Severity.new(input).part_one_a).to eq(1728)
    end
  end

  describe '#part_two' do
    it 'solves small input' do
      input = File.read('spec/day_thirteen/test_input.txt')
      expect(DayThirteen::Severity.new(input).part_two).to eq(10)
    end

    it 'solves small input' do
      input = File.read('spec/day_thirteen/test_input.txt')
      expect(DayThirteen::Severity.new(input).part_two_a).to eq(10)
    end

    # I'm pretty sure the brute force method works.. but haven't left it running long enough to actually find out!
    # it 'solves' do
    #   input = File.read('spec/day_thirteen/input.txt')
    #   expect(DayThirteen::Severity.new(input).part_two).to eq(3946838)
    # end

    it 'solves' do
      input = File.read('spec/day_thirteen/input.txt')
      expect(DayThirteen::Severity.new(input).part_two_a).to eq(3946838)
    end
  end
end
