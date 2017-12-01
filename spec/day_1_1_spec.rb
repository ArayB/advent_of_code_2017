require 'rspec'
require_relative '../lib/day_one/problem_one.rb'

RSpec.describe DayOne::Problem1 do
  describe '#run' do
    subject { described_class.new(@input).run }
    [
      ['1122', 3],
      ['1111', 4],
      ['1234', 0],
      ['91212129', 9]
    ].each do |input, sum|
      it 'returns correctly' do
        @input = input
        expect(subject).to eq(sum)
      end
    end
  end
end
