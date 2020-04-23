# frozen_string_literal: true

require_relative('../custom_collatz')

describe CustomCollatz do
  let!(:custom_collatz) { CustomCollatz.new }

  describe '#pair?' do
    context 'give two numbers' do
      let!(:pair_number) { 2 }
      let!(:odd_number)  { 3 }

      context 'when number is pair' do
        it 'must return true' do
          expect(custom_collatz.send(:pair?, pair_number)).to eq(true)
        end
      end

      context 'when number is odd' do
        it 'must return false' do
          expect(custom_collatz.send(:pair?, odd_number)).to eq(false)
        end
      end
    end
  end

  describe '#multiple?' do
    context 'give a factor and number' do
      let!(:factor)     { 3 }
      let!(:number_one) { 6 }
      let!(:number_two) { 2 }

      context 'when number one is multiple of factor' do
        it 'must return true' do
          expect(custom_collatz.send(:multiple?, factor, number_one)).to eq(true)
        end
      end

      context 'when number two is not multiple of factor' do
        it 'must return false' do
          expect(custom_collatz.send(:multiple?, factor, number_two)).to eq(false)
        end
      end
    end
  end

  describe '#collatz' do
    context 'give a any number' do
      let!(:number) { 120 }

      it 'must return a quantity of interators' do
        expect(custom_collatz.collatz(number)).to eq(20)
      end
    end
  end
end
