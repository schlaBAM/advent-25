def main
  input = File.readlines('input.txt', chomp: true).map(&:chars)

  operations = input.pop.reject { |c| c == ' ' }
  columns = input.transpose.map { |row| row.join.strip }

  num_groups = columns
               .slice_before { |v| v == '' }
               .map { |g| g.reject(&:empty?).map(&:to_i) }

  num_groups.each_with_index.sum do |nums, index|
    nums.reduce { |acc, num| acc.send(operations[index], num) }
  end
end

puts main
