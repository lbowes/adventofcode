def is_valid(input_str)
    digits = input_str.scan(/\d+/).map{|n| n.to_i - 1}
    char = input_str.partition(':').first[-1]
    pwd = input_str.split.last

    (pwd[digits.first] == char) ^ (pwd[digits.last] == char)
end

entries = File.readlines(File.join(File.dirname(__FILE__), './input.txt'))

puts entries.count{|password| is_valid password}
