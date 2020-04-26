# frozen_string_literal: true

# class roman date
# @author Elton Fonseca
class RomanDate
  def initialize
    @hash_mapping = {
      1000 => 'M', 900 => 'CM',
      500 => 'D',  400 => 'CD',
      100 => 'C',  90 => 'XC',
      50 => 'L',   40 => 'XL',
      10 => 'X',   9 => 'IX',
      5 => 'V',    4 => 'IV',
      1 => 'I'
    }
  end

  def time_now
    arabic_date = date
    arabic_hour = hour
    roman_date = convert_to_roman(separate(arabic_date, '/'), '/')
    roman_hour = convert_to_roman(separate(arabic_hour, ':'), ':')
    ["#{arabic_date} - #{arabic_hour}", "#{roman_date} - #{roman_hour}"]
  end

  private

  def convert_to_roman(values, separator)
    final_value = ''
    values.each_with_index do |value, index|
      final_value += roman(value.to_i)
      final_value += separator if index < 2
    end
    final_value
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end

  def separate(string, separator)
    string.split(separator)
  end

  def hour
    Time.now.strftime('%H:%M:%S')
  end

  def roman(number)
    return nil if number > 3999 || number.zero?

    result = ''
    @hash_mapping.each do |arabic_number, letter|
      result += letter * (number / arabic_number)
      number %= arabic_number
    end
    result
  end
end
