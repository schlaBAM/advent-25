def main
  rows = File.readlines('input.txt', chomp: true)

  ops = rows.pop.delete(' ').chars
  op_index = 0

  total = 0
  numbers = []

  (0...rows[0].length).each do |col|
    current = ''

    rows.each do |row|
      num = row[col]
      current << num if num && num != ' '
    end

    if current.empty? && !numbers.empty?
      total += numbers.reduce { |a, b| a.public_send(ops[op_index], b) }
      numbers.clear
      op_index += 1
    elsif !current.empty?
      numbers << current.to_i
    end
  end

  total += numbers.reduce { |a, b| a.public_send(ops[op_index], b) } unless numbers.empty? # last col purge
end

puts main
