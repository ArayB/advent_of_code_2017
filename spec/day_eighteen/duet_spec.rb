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

    it 'solves' do
      input = <<EOS
      set i 31
      set a 1
      mul p 17
      jgz p p
      mul a 2
      add i -1
      jgz i -2
      add a -1
      set i 127
      set p 826
      mul p 8505
      mod p a
      mul p 129749
      add p 12345
      mod p a
      set b p
      mod b 10000
      snd b
      add i -1
      jgz i -9
      jgz a 3
      rcv b
      jgz b -1
      set f 0
      set i 126
      rcv a
      rcv b
      set p a
      mul p -1
      add p b
      jgz p 4
      snd a
      set a b
      jgz 1 3
      snd b
      set f 1
      add i -1
      jgz i -11
      snd a
      jgz f -16
      jgz a -19
EOS
      expect(DayEighteen::Duet.new.part_one(input)).to eq(7071)
    end
  end
end
