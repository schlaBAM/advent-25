def main
  grid = File.readlines('input.txt', chomp: true).map(&:chars)
  total = 0

  result = locate_rolls(grid)
  total += result[:count]

  while result[:count] != 0
    result = locate_rolls(result[:grid])
    total += result[:count]
  end

  total
end

def locate_rolls(grid)
  neighbors = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
  height = grid.length
  width = grid[0].length
  count = 0

  output = grid.map.with_index do |line, row|
    line.map.with_index do |val, col|
      if val == '@'
        adjacent_rolls = 0
        neighbors.each do |ny, nx|
          new_row = row + ny
          new_col = col + nx
          next if new_row.negative? || new_col.negative? || new_row >= height || new_col >= width

          adjacent_rolls += 1 if grid[new_row][new_col] == '@'
          break if adjacent_rolls >= 4
        end
        if adjacent_rolls < 4
          count += 1
          '.'
        else
          '@'
        end
      else
        '.'
      end
    end
  end

  { grid: output, count: count }
end

puts main
