# frozen_string_literal: true

BANK_SIZE = 12

def main
  File.readlines('input.txt', chomp: true).sum { |bank| joltage(bank) }
end

def joltage(bank)
  digits = highest_splice(bank.chars.map(&:to_i))

  digits_left = digits.length - BANK_SIZE
  result = []

  digits.each do |d|
    while !result.empty? && digits_left.positive? && result.last < d
      result.pop
      digits_left -= 1
    end
    result << d
  end

  result[0...BANK_SIZE].join.to_i
end

# there's likely a ton of unusable digits between idx[0] and idx[-BANK_SIZE]. let's remove them.
def highest_splice(digits)
  max_index = 0
  max_digit = 1
  index_cutoff = digits.length - BANK_SIZE - 1

  0.upto(index_cutoff) do |i|
    if digits[i] > max_digit
      max_digit = digits[i]
      max_index = i
    end
  end

  digits[max_index..]
end

puts main
