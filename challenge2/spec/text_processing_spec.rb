# frozen_string_literal: true

require_relative('../text_processing')

describe TextProcessing do
  let!(:text_processing) { TextProcessing.new }

  describe '#text_concat' do
    context 'give two texts' do
      let!(:text_one) { 'Nikola ' }
      let!(:text_two) { 'Tesla' }

      context 'when the texts is separated' do
        it 'must be return text join' do
          text_processing.send(:text_concat, text_one)
          expect(text_processing.send(:text_concat, text_two)).to eq('Nikola Tesla')
        end
      end
    end
  end

  describe '#count_upcase_words' do
    context 'give a array string upcase' do
      let!(:array) { %w[NIKOLA TESLA] }

      it 'must be return quantity of words upcase' do
        expect(text_processing.send(:count_upcase_words, array)).to eq(2)
      end
    end
  end

  describe '#number?' do
    context 'give two strings' do
      let!(:string_one) { '123' }
      let!(:string_two) { 'abcd' }

      context 'when a text is a number' do
        it 'must be return true' do
          expect(text_processing.send(:number?, string_one)).to eq(true)
        end
      end

      context 'when a text is not a number' do
        it 'must be return false' do
          expect(text_processing.send(:number?, string_two)).to eq(false)
        end
      end
    end
  end

  describe '#capitalize?' do
    context 'give two strings' do
      let!(:string_one) { 'Nikola' }
      let!(:string_two) { 'tesla' }

      context 'when a text is a capitalize' do
        it 'must be return true' do
          expect(text_processing.send(:capitalize?, string_one)).to eq(true)
        end
      end

      context 'when a text is not a capitalize' do
        it 'must be return false' do
          expect(text_processing.send(:capitalize?, string_two)).to eq(false)
        end
      end
    end
  end

  describe '#separate_string' do
    context 'give a text with separator' do
      let!(:text) { 'Em\xA0breve\xA0teremos\xA0o\xA0vortex!' }
      let!(:regex) { '\\xA0' }

      it 'must be return array of strings' do
        expect(text_processing.send(:separate_string, text, regex).length).to eq(5)
      end
    end
  end

  describe '#binary?' do
    context 'give two texts' do
      let!(:binary_text) { '01010100' }
      let!(:any_text) { 'dqweasgq' }

      context 'when a text is a binary' do
        it 'must be return true' do
          expect(text_processing.send(:binary?, binary_text)).to eq(true)
        end
      end

      context 'when a text is not a binary' do
        it 'must be return false' do
          expect(text_processing.send(:binary?, any_text)).to eq(false)
        end
      end
    end
  end

  describe '#get_binary_number' do
    context 'give two texts' do
      let!(:text_one) { 'asds01010100011001010111001101110100dass' }
      let!(:text_two) { 'asdsdass' }

      context 'when a text with 0 and 1 included' do
        it 'must be return only binary text' do
          expect(text_processing.send(:get_binary_number, text_one)).to eq('01010100011001010111001101110100')
        end
      end

      context 'when a text wihtout 0 and 1 included' do
        it 'must be return empty string' do
          expect(text_processing.send(:get_binary_number, text_two)).to eq('')
        end
      end
    end
  end

  describe '#convert_binary_to_text' do
    context 'give two texts' do
      let!(:binary_text) { '01010100011001010111001101110100' }
      let!(:text) { 'sa23sdf' }

      context 'when string contains only 0 and 1' do
        it 'must return string decoded' do
          expect(text_processing.send(:convert_binary_to_text, binary_text)).to eq('Test')
        end
      end

      context 'when string not contains only 0 and 1' do
        it 'must return empty' do
          expect(text_processing.send(:convert_binary_to_text, text)).to eq('')
        end
      end
    end
  end
end
