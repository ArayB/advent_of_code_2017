require 'rspec'
require_relative '../../lib/day_one/problem_two.rb'

RSpec.describe DayOne::Problem2 do
  describe '#run' do
    subject { described_class.new(@input).run }
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
