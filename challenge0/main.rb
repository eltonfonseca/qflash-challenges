# frozen_string_literal: true

require_relative('./custom_collatz')

input_number = gets.chomp
interators = CustomCollatz.new.collatz(input_number.to_i)
p "Interators at 1: #{interators}"
