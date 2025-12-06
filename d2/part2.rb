# frozen_string_literal: true

def main
  input = File.read('d2/input.txt', chomp: true).split(',')

  total = 0

  ranges = input.map do |range|
    range.split('-').map!(&:to_i)
  end

  ranges.each do |start, finish|
    total += find_patterns(start, finish)
  end

  total
end

def find_patterns(start, finish)
  total = 0
  start.upto(finish) do |num|
    num_string = num.to_s
    num_length = num_string.length

    next if num_length == 1 # edge: skip single digit nums

    divisors = find_divisors(num_length)

    divisors.each do |div|
      if repeating_chunks?(num_string, div)
        total += num
        break
      end
    end
  end
  total
end

def find_divisors(length)
  (1..length / 2).select { |num| length % num == 0 }
end

def repeating_chunks?(num, chunk_size)
  return false if chunk_size.zero?

  first = num[0, chunk_size]
  (0...num.length).step(chunk_size).each do |i|
    return false if num[i, chunk_size] != first
  end

  true
end

puts main
