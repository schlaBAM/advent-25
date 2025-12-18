def main
  rows = File.readlines('input.txt', chomp: true)
  start_col = rows.shift.index('S')

  count = 0
  current_beams = Set[start_col]

  rows.each do |row|
    next_beams = Set.new
    row.chars.each_with_index do |cell, idx|
      next unless current_beams.include?(idx)

      if cell == '^'
        count += 1
        next_beams.add(idx - 1)
        next_beams.add(idx + 1)
      else
        next_beams.add(idx)
      end
    end
    current_beams = next_beams
  end

  count
end

puts main
