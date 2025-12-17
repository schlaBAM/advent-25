def main
  input = File.readlines('input.txt', chomp: true).map(&:split)

  operations = input.pop
  values = input.map { |row| row.map(&:to_i) }

  values.each do |row|
    row.each_with_index do |val, idx|
      accumulators[idx] = if accumulators[idx].nil?
                            val
                          else
                            accumulators[idx].send(operations[idx], val)
                          end
    end
  end

  accumulators.sum
end

puts main
