# frozen_string_literal: true

START_POSITION = 50
MAX_POSITION = 100

def main
  current_position = START_POSITION
  count = 0

  File.foreach('d1/input.txt', chomp: true).each do |seq|
    direction = seq[0].upcase
    rotations = seq[1..].to_i

    count += (rotations / MAX_POSITION)
    rotations %= MAX_POSITION

    unless current_position.zero?
      count += 1 if direction == 'L' && rotations >= current_position
      count += 1 if direction == 'R' && rotations >= (MAX_POSITION - current_position)
    end

    current_position = if direction == 'L'
                         (current_position - rotations) % MAX_POSITION
                       else
                         (current_position + rotations) % MAX_POSITION
                       end
  end

  count
end

puts main
