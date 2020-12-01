#!/usr/bin/ruby

lines = File.readlines('input.txt').map(&:to_i).sort

for x in lines
    for y in lines
        for z in lines
            if x + y + z == 2020
                product = x * y * z
                break
            end
        end
    end
end

puts product
