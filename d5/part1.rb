def main
  input = File.readlines('input.txt', chomp: true).slice_before(&:empty?).map { |id| id.reject(&:empty?) }

  ranges = input[0].map { |r| r.split('-').map(&:to_i) }.sort
  ids = input[1].map(&:to_i)

  updated_ranges = merge(ranges)
  count_freshness(ids, updated_ranges)
end

def merge(ranges)
  merged = []
  ranges.each do |first, last|
    if merged.empty? || first > merged[-1][1] + 1
      merged << [first, last]
    else
      merged[-1][1] = [merged[-1][1], last].max
    end
  end
  merged
end

def count_freshness(list, ranges)
  list.count do |id|
    ranges.any? { |first, last| id >= first && id <= last} # binary search this instead if list grows
  end
end

puts main
