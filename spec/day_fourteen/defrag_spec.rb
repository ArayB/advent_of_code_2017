require 'rspec'
require_relative '../../lib/day_fourteen/defrag.rb'

RSpec.describe DayFourteen::Defrag do
  describe '#part_one'
  it 'returns correctly' do
    input = 'flqrgnkx'

    expect(DayFourteen::Defrag.new.part_one(input)).to eq(8108)
  end

  it 'solves' do
    input = 'wenycdww'

    expect(DayFourteen::Defrag.new.part_one(input)).to eq(8226)
  end
end
