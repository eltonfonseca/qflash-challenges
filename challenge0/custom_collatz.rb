# frozen_string_literal: true

# Challange 0

# class collatz algorithm
# @author Elton Fonseca
class CustomCollatz
  def initialize
    @count = 0
  end

  def collatz(number)
    return @count if number <= 1

    p 'foo' if multiple?(3, number)
    p 'bar' if multiple?(5, number)
    @count += 1

    pair?(number) ? collatz(number / 2) : collatz(3 * number + 1)
  end

  private

  def multiple?(factor, number)
    (number % factor).zero?
  end

  def pair?(number)
    (number % 2).zero?
  end
end
