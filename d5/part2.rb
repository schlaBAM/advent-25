def main
  ranges = File.readlines('input.txt', chomp: true)
               .take_while { |line| !line.empty? }
               .map { |r| r.split('-').map(&:to_i) }
               .sort # lol

  fresh_ranges = merge(ranges)
  count(fresh_ranges)
end

def merge(ranges)
  merged = []
  ranges.each do |first, last|
    if merged.empty? || merged[-1][1] + 1 < first
      merged << [first, last]
    else
      merged[-1][1] = [merged[-1][1], last].max
    end
  end
  merged
end

def count(ranges)
  ranges.sum { |first, last| last - first + 1 }
end

puts main

###
# for chaos -
#
# merge(File.readlines('input.txt', chomp: true)
#               .take_while { |line| !line.empty? }
#               .map { |r| r.split('-').map(&:to_i) }
#               .sort
#               ).sum {|first, last| last - first + 1 }
###
