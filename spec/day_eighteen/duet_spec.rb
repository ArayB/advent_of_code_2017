require 'rspec'
require_relative '../../lib/day_eighteen/duet.rb'

RSpec.describe DayEighteen::Duet do
  describe '#part_one' do
    it 'returns correctly' do

      input = <<EOS
      set a 1
      add a 2
      mul a a
      mod a 5
      snd a
      set a 0
      rcv a
      jgz a -1
      set a 1
      jgz a -2
EOS
      expect(DayEighteen::Duet.new.part_one(input)).to eq(4)
    end
  end
end
