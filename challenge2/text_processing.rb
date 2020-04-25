# frozen_string_literal: true

# class text processing
# @author Elton Fonseca
class TextProcessing
  def initialize
    @final_text = ''
    @count_upcase_words = 0
  end

  def process
    file_text = load_file('2.txt', 'r')
    array_strings = separate_string(file_text, '\\xA0')

    array_strings.each do |string|
      text_concat(string)
      count_upcase_words([string])
      @final_text += ' '
    end
    [@final_text, @count_upcase_words]
  end

  private

  def convert_binary_to_text(string)
    binary_string = get_binary_number(string)
    chars = binary_string.scan(/.{1,8}/).map do |char|
      char.to_i(2).chr
    end
    chars.join
  end

  def text_concat(text)
    return @final_text += text unless binary?(text)

    text_decoded = convert_binary_to_text(text)
    count_upcase_words(text_decoded.split(' '))
    @final_text += text_decoded
  end

  def count_upcase_words(array)
    array.each do |text|
      @count_upcase_words += 1 if uppercase?(text)
    end
    @count_upcase_words
  end

  def number?(string)
    string.scan(/\D/).empty?
  end

  def uppercase?(string)
    return false if capitalize?(string) || number?(string)

    string.upcase == string
  end

  def capitalize?(string)
    string.length > 1 ? string.capitalize == string : false
  end

  def separate_string(text, regex)
    text.split(regex)
  end

  def binary?(text)
    get_binary_number(text).length.positive?
  end

  def get_binary_number(text)
    text.scan(/[0-1]/).join
  end

  def load_file(file_path, mode)
    File.open(file_path, mode).read
  end
end
