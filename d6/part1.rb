def main
  input = File.readlines('input.txt', chomp: true).map(&:split)

  operations = input.pop
  values = input.map { |row| row.map(&:to_i) }

  # if we're sure the rows are equal length this can all just be values.transpose
  columns = Hash.new { |h, k| h[k] = [] }

  values.each do |arr|
    arr.each_with_index do |val, idx|
      columns[idx] << val
    end
  end

  columns.each_key.sum do |idx|
    columns[idx].reduce { |acc, val| acc.send(operations[idx], val) }
  end
end

puts main
