#!/usr/bin/ruby

values = File.readlines('input.txt').map(&:to_i).sort

for pair in values.combination(2)
    if pair.sum == 2020
        puts pair.inject(:*)
        break
    end
end
