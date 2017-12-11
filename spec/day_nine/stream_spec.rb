require 'rspec'
require_relative '../../lib/day_nine/stream.rb'

RSpec.describe DayNine::Stream do
  describe '#part_one' do
    [
      ['{}', 1],
      ['{{{}}}', 6],
      ['{{},{}}', 5],
      ['{{{},{},{{}}}}', 16],
      ['{<a>,<a>,<a>,<a>}', 1],
      ['{{<ab>},{<ab>},{<ab>},{<ab>}}', 9],
      ['{{<!!>},{<!!>},{<!!>},{<!!>}}', 9],
      ['{{<a!>},{<a!>},{<a!>},{<ab>}}', 3]
    ].each do |input, groups|
      it "returns correctly for #{input}" do
        expect(DayNine::Stream.new(input).part_one).to eq(groups)
      end
    end

    it 'solves' do
      input = File.read('spec/day_nine/input.txt')
      expect(DayNine::Stream.new(input).part_one).to eq(11898)
    end
  end

  describe '#part_two' do
    [
     ['<>', 0],
     ['<random characters>', 17],
     ['<<<<>', 3],
     ['<{!>}>', 2],
     ['<!!>', 0],
     ['<!!!>>', 0],
     ['<{o"i!a,<{i<a>', 10]
    ].each do |input, chars|
      it "returns correctly for #{input}" do
        expect(DayNine::Stream.new(input).part_two).to eq(chars)
      end
    end

    it 'solves' do
      input = File.read('spec/day_nine/input.txt')
      expect(DayNine::Stream.new(input).part_two).to eq(5601)
    end
  end
end
