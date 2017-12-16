require 'rspec'
require_relative '../../lib/day_sixteen/dancing.rb'

RSpec.describe DaySixteen::Dancing do
  describe '#part_one' do
    context 'for short range' do

      it 'spins correctly' do
        input = 's1'
        expect(DaySixteen::Dancing.new(input, 'abcde').part_one).to eq('eabcd')
      end

      it 'exchanges correctly' do
        input = 'x3/4'
        expect(DaySixteen::Dancing.new(input, 'abcde').part_one).to eq('abced')
      end

      it 'partners correctly' do
        input = 'pe/b'
        expect(DaySixteen::Dancing.new(input, 'abcde').part_one).to eq('aecdb')
      end

      it 'combines instructions' do
        input = 's1,x3/4,pe/b'
        expect(DaySixteen::Dancing.new(input, 'abcde').part_one).to eq('baedc')
      end
    end

    it 'solves' do
      input = File.read('input/16/input.txt')
      expect(DaySixteen::Dancing.new(input, 'abcdefghijklmnop').part_one).to eq('kbednhopmfcjilag')
    end
  end

  describe '#part_two' do
    it 'solves' do
      input = File.read('input/16/input.txt')
      expect(DaySixteen::Dancing.new(input, 'abcdefghijklmnop').part_two).to eq('fbmcgdnjakpioelh')
    end
  end
end
