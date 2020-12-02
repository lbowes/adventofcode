file = File.join(File.dirname(__FILE__), './input.txt')
lines = File.readlines(file)

valid_count = 0

for l in lines
    components = l.split(':').map(&:strip)

    policy = components[0]
    password = components[1]

    policy_components = policy.split(' ')
    policy_range_bounds = policy_components[0].split('-').map(&:to_i)
    policy_char = policy_components[1]

    occurences = password.count(policy_char)

    if occurences >= policy_range_bounds[0] && occurences <= policy_range_bounds[1]
        valid_count += 1
    end
end

puts valid_count
