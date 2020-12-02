def is_valid(input_str)
    digits = input_str.scan(/\d+/).map{|n| n.to_i}
    char = input_str.partition(':').first[-1]
    pwd = input_str.split.last
    char_count = pwd.count(char)

    char_count >= digits.first && char_count <= digits.last
end

entries = File.readlines(File.join(File.dirname(__FILE__), './input.txt'))

puts entries.count{|password| is_valid password}
