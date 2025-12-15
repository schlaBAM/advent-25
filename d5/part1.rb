def main
  input = File.readlines('input.txt', chomp: true).slice_before(&:empty?).map { |id| id.reject(&:empty?) }

  ranges = input[0].map { |r| r.split('-').map(&:to_i) }.sort
  ids = input[1].map(&:to_i)

  # updated_ranges = condense_ranges(ranges.sort)
  count_freshness(ids, ranges)
end

def condense_ranges(input)

  # with the inputs sorted, we know that the min range is larger than the previous.
end

def count_freshness(list, ranges)
  list.count do |id|
    ranges.any? { |first, last| id >= first && id <= last}
  end
end

puts main
