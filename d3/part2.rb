# frozen_string_literal: true

def main
  File.readlines('input.txt', chomp: true).sum { |bank| joltage(bank.to_i) }
end

def joltage(num)
  digits = num.digits.reverse
  hash = Hash.new { |h, k| h[k] = [] }

  max_index = 0
  max_digit = 1
  0.upto(digits.length - 13) do |i|
    if digits[i] > max_digit
      max_digit = digits[i]
      max_index = i
    end
  end

  digits = digits[max_index..]

  digits.each_with_index do |num, idx|
    hash[num] << idx
  end

  idx = 1

  until digits.length == 12
    if digits.length - hash[idx].length > 12
      digits.delete(idx)
    else
      delete_num = digits.length - 12
      deleted = 0

      while delete_num > 0 && !hash[idx].empty?
        digits.delete_at(hash[idx].first - deleted)
        hash[idx].shift
        delete_num -= 1
        deleted += 1
      end
    end
    idx += 1
  end

  num = digits.join.to_i
  puts num
  num
end

puts main
