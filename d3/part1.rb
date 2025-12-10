# frozen_string_literal: true

def main
  File.readlines('input.txt', chomp: true).sum { |bank| joltage(bank.to_i) }
end

# Search for highest digit before num.last. Search rest of range for second digit
def joltage(num)
  digits = num.digits.reverse

  left_max = 1
  left_index = 0

  digits[0...-1].each_with_index do |num, idx|
    if num > left_max
      left_max = num
      left_index = idx
    end
  end

  right_max = digits[(left_index + 1)..].max

  (left_max * 10) + right_max
end

puts main
