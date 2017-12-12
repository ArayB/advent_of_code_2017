require 'rspec'
require_relative '../../lib/day_twelve/groups.rb'

RSpec.describe DayTwelve::Groups do
  describe '#part_one' do
    it 'solves short example' do
      input = File.read('spec/day_twelve/test_input.txt')
      expect(DayTwelve::Groups.new(input).part_one).to eq(6)
    end

    it 'solves' do
      input = File.read('spec/day_twelve/input.txt')
      expect(DayTwelve::Groups.new(input).part_one).to eq(283)
    end
  end

  describe '#part_two' do
    it 'solves short example' do
      input = File.read('spec/day_twelve/test_input.txt')
      expect(DayTwelve::Groups.new(input).part_two).to eq(2)
    end

    it 'solves' do
      input = File.read('spec/day_twelve/input.txt')
      expect(DayTwelve::Groups.new(input).part_two).to eq(195)
    end
  end
end
