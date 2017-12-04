require 'rspec'
require_relative '../../lib/day_four/passphrase.rb'

RSpec.describe DayFour::Passphrase do
  describe '#total_valid' do
    subject { DayFour::Passphrase.new(@input).total_valid }
    context 'with single line input' do
      it 'counts valid correctly' do
        @input = 'aa bb cc dd ee'
        expect(subject).to eq(1)
      end

      it 'does not count invalid' do
        @input = 'aa bb cc dd aa'
        expect(subject).to eq(0)
      end
    end

    context 'with multi line input' do
      it 'returns correctly' do
        @input = "aa bb cc dd ee\n" \
                  "aa bb cc dd aa\n" \
                  "aa bb cc dd aaa"
        expect(subject).to eq(2)
      end
    end
  end

  describe '#total_anagram_valid' do
    subject { DayFour::Passphrase.new(@input).total_anagram_valid }
    context 'with single row' do
      it 'counts valid correctly' do
        @input = "abcde fghij"
        expect(subject).to eq(1)
      end

      it 'counts invalid correctly' do
        @input = "abcde xyz ecdab"
        expect(subject).to eq(0)
      end
    end

    context 'with multi line input' do
      it 'counts correctly' do
        @input = "abcde fghij\n" \
          "abcde xyz ecdab\n" \
          "a ab abc abd abf abj\n" \
          "iiii oiii ooii oooi oooo is valid.\n" \
          "oiii ioii iioi iiio\n"
        expect(subject).to eq(3)
      end
    end
  end
end
