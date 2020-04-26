# frozen_string_literal: true

require_relative('../roman_date')

describe RomanDate do
  let!(:roman_date) { RomanDate.new }

  describe '#roman' do
    context 'give three numbers' do
      let!(:limit_high) { 4000 }
      let!(:limit_low) { 0 }
      let!(:any_number) { 2012 }

      context 'when number is bigger that limit' do
        it 'must be return nil' do
          expect(roman_date.send(:roman, limit_high)).to eq(nil)
        end
      end

      context 'when number is zero' do
        it 'must be return nil' do
          expect(roman_date.send(:roman, limit_low)).to eq(nil)
        end
      end

      context 'when number is on limits' do
        it 'must be return roman number' do
          expect(roman_date.send(:roman, any_number)).to eq('MMXII')
        end
      end
    end
  end

  describe '#separate' do
    context 'give one date' do
      let!(:date) { '21/04/2020' }

      it 'must be return separate date' do
        expect(roman_date.send(:separate, date, '/').class).to eq(Array)
      end
    end
  end

  describe '#convert_to_roman' do
    context 'give one date' do
      let!(:date) { ['21', '04', '2020'] }

      it 'must be return roman date' do
        expect(roman_date.send(:convert_to_roman, date, '/')).to eq('XXI/IV/MMXX')
      end
    end
  end
end
