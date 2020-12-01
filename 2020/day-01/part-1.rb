#!/usr/bin/ruby

lines = File.readlines('input.txt').map(&:to_i).sort

for x in lines
    for y in lines
        if x + y == 2020
            product = x * y
            break
        end
    end
end

puts product
