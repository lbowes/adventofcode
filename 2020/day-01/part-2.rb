#!/usr/bin/ruby

values = File.readlines('input.txt').map(&:to_i).sort

for triplet in values.combination(3)
    if triplet.sum == 2020
      puts triplet.inject(:*)
      break
    end
end
