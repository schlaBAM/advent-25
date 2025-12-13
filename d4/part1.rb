# frozen_string_literal: true

def main
  roll_access(File.readlines('input.txt', chomp: true).map(&:chars))
end

def roll_access(grid)
  neighbors = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
  result = Array.new(grid.length) {Array.new(grid[0].length)}

  grid.each_with_index do |line, row|
    line.each_with_index do |val, col|
      if val == '@'
        count = 0

        neighbors.each do |ny, nx|
          new_row = row + ny
          new_col = col + nx
          next if new_row.negative? || new_row == grid.length || new_col.negative? || new_col == line.length
          break if count >= 4

          count += 1 if grid[new_row][new_col] == '@'
        end

        result[row][col] = count < 4 ? 'x' : '@'
      else
        result[row][col] = '.'
      end
    end
  end

  result.sum { |row| row.count('x') }
end

puts main
