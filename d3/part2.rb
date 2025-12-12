# frozen_string_literal: true

BANK_SIZE = 12

def main
  File.readlines('input.txt', chomp: true).sum { |bank| joltage(bank.to_i) }
end

def joltage(num)
  digits = num.digits.reverse
  digits_index = Hash.new { |h, k| h[k] = [] }

  digits = highest_splice(digits)

  digits.each_with_index do |num, idx|
    digits_index[num] << idx
  end

  current_index = 1
  index_dump = []
  bank_length = digits.length

  until bank_length == BANK_SIZE
    if digits.length - digits_index[current_index].length > BANK_SIZE
      index_dump << digits_index[current_index]
      bank_length -= digits_index[current_index].length
    else
      digits_to_delete = bank_length - BANK_SIZE

      while digits_to_delete > 0 
        # IDEA: put indexes into an array, and delete from the back

        index_dump << digits_index[current_index][0...digits_to_delete]
        bank_length -= digits_index[current_index][0...digits_to_delete].length
      end
    end
    current_index += 1
  end

  index_dump = index_dump.flatten.sort

  index_dump.reverse.each do |idx|
    digits.delete_at(idx)
  end

  x = digits.join.to_i
  puts x

  x
end

def highest_splice(digits)
  max_index = 0
  max_digit = 1
  0.upto(digits.length - BANK_SIZE - 1) do |i|
    if digits[i] > max_digit
      max_digit = digits[i]
      max_index = i
    end
  end

  digits[max_index..]
end

puts main
