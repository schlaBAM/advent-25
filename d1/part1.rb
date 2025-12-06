# frozen_string_literal: true

START_POSITION = 50
MAX_POSITION = 100

def main
  current_position = START_POSITION

  File.foreach('d1/input.txt', chomp: true).count do |seq|
    direction = seq[0].upcase
    rotations = seq[1..].to_i
    current_position = rotate(current_position, rotations, direction)
    current_position.zero?
  end
end

def rotate(position, rotations, direction)
  rotations %= MAX_POSITION
  if direction == 'L'
    (position - rotations) % MAX_POSITION
  else
    (position + rotations) % MAX_POSITION
  end
end

puts main
