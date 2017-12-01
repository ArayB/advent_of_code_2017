require 'rspec'
require_relative '../../lib/day_one/array_pair_matcher.rb'

RSpec.describe DayOne::ArrayPairMatcher do
  describe '#run' do
    context 'when step is 1' do
      subject { described_class.new(@input, 1).run }
      [
        ['1122', 3],
        ['1111', 4],
        ['1234', 0],
        ['91212129', 9]
      ].each do |input, sum|
        it "returns correctly for #{input}" do
          @input = input
          expect(subject).to eq(sum)
        end
      end
    end

    context 'when step is half array size' do
      subject { described_class.new(@input, (@input.length / 2)) .run }
      [
        ['1212', 6],
        ['1221', 0],
        ['123425', 4],
        ['123123', 12],
        ['12131415', 4]
      ].each do |input, sum|
        it "returns correctly for #{input}" do
          @input = input
          expect(subject).to eq(sum)
        end
      end
    end
  end
end
