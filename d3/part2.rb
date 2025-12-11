# frozen_string_literal: true

def main
  File.readlines('input.txt', chomp: true).sum { |bank| joltage(bank.to_i) }
end

def joltage(num)

end

puts main
