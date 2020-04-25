# frozen_string_literal: true

require_relative('text_processing')

text, count = TextProcessing.new.process

puts "Text Decoded\n\n"
puts text
puts "\n\n"
puts "Uppercase Words: #{count}"
