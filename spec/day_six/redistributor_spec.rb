require 'rspec'
require_relative '../../lib/day_six/redistributor.rb'

RSpec.describe DaySix::Redistributor do
  describe '#part_one' do
    it 'returns correctly' do
      input = "0 2 7 0"

      expect(DaySix::Redistributor.new(input).part_one).to eq(5)
    end
  end
end
