# frozen_string_literal: true

require_relative('roman_date')

arabic_time, roman_time = RomanDate.new.time_now

puts "Arabic Time: #{arabic_time}"
puts "Roman Time: #{roman_time}"
