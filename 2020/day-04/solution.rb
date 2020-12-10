passports = File.readlines('input.txt').join.split("\n\n")

# part 1
puts passports.count {|passport|
   ["byr","iyr","eyr","hgt","hcl","ecl","pid"].all? {|field|
       passport.include? field
   }
}

def valid_hgt(passport)
    hgt = passport.match(/hgt:(\d+)(cm|in)/)
    range = hgt&.captures&.last == 'cm' ? [150, 193] : [59, 76]
    (hgt&.captures&.first.to_i.between?(*range))
end

def valid_year(passport, name, range)
    passport.match(/#{name}:(\d{4})/)&.captures&.first.to_i.between? *range
end

def valid_hcl(passport)
    /hcl:#[0-9a-f]{6}/.match?(passport)
end

def valid_ecl(passport)
    /ecl:(amb|blu|brn|gry|grn|hzl|oth)/.match?(passport)
end

def valid_pid(passport)
    /pid:\d{9}\b/.match?(passport)
end

def is_valid(passport)
    outputs = [
        valid_hgt(passport),
        valid_year(passport, "byr", [1920, 2002]),
        valid_year(passport, "iyr", [2010, 2020]),
        valid_year(passport, "eyr", [2020, 2030]),
        valid_hcl(passport),
        valid_ecl(passport),
        valid_pid(passport)
    ].all?
end

# part 2
puts passports.count {|passport| is_valid passport}
