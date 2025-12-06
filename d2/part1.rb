# frozen_string_literal: true

def main
  commands = File.read('d2/input.txt', chomp: true).split(',')
  ranges = commands.map { |cmd| cmd.split('-').map!(&:to_i) }

  count = 0

  ranges.each do |start, finish|
    count += find_patterns(start, finish)
  end

  count
end

def find_patterns(start, finish)
  total = 0
  start.upto(finish) do |num|
    num_string = num.to_s
    next if num_string.length.odd?

    half = num_string.length / 2
    total += num if num_string[0...half] == num_string[half..]
  end
  total
end

puts main
