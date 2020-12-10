require_relative "solution"
require "test/unit"

class TestSolution < Test::Unit::TestCase
    def test_valid_years
        #byr
        {
            "byr:1919" => false,
            "byr:1920" => true,
            "byr:1921" => true,
            "byr:2002" => true,
            "byr:2003" => false
        }.all? {|input, expected_output|
            valid_year(input, "byr", [1920, 2002]) == expected_output
        }

        #iyr
        {
            "iyr:2009" => false,
            "iyr:2010" => true,
            "iyr:2011" => true,
            "iyr:2020" => true,
            "iyr:2021" => false
        }.all? {|input, expected_output|
            valid_year(input, "iyr", [2010, 2020]) == expected_output
        }

        #eyr
        {
            "eyr:2019" => false,
            "eyr:2020" => true,
            "eyr:2021" => true,
            "eyr:2030" => true,
            "eyr:2031" => false
        }.all? {|input, expected_output|
           valid_year(input, "eyr", [2020, 2030]) == expected_output
        }
    end

    def test_valid_hgt
        {
            "hgt:60in" => true,
            "hgt:190cm" => true,
            "hgt:190in" => false,
            "hgt:190" => false
        }.all? {|input, expected_output|
            valid_hgt(input) == expected_output
        }
    end

    def test_valid_hcl
        {
            "hcl:#123abc" => true,
            "hcl:#123abz" => true,
            "hcl:#123abz" => false
        }.all? {|input, expected_output|
            valid_hcl(input) == expected_output
        }
    end

    def test_valid_ecl
        {
            "ecl:brn" => true,
            "ecl:wat" => false
        }.all? {|input, expected_output|
            valid_ecl(input) == expected_output
        }
    end

    def test_valid_pid
        {
            "pid:000000001" => true,
            "pid:0123456789" => false
        }.all? {|input, expected_output|
            valid_pid(input) == expected_output
        }
    end

    def test_is_valid
        invalid_passports = [
            "eyr:1972 cid:100\nhcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926\n",
            "iyr:2019\nhcl:#602927 eyr:1967 hgt:170cm\necl:grn pid:012533040 byr:1946\n",
            "hcl:dab227 iyr:2012\necl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277\n",
            "hgt:59cm ecl:zzz\neyr:2038 hcl:74454a iyr:2023\npid:3556412378 byr:2007\n"
        ]

        invalid_passports.each do |passport|
            assert !is_valid(passport)
        end

        valid_passports = [
            "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980\nhcl:#623a2f\n",
            "eyr:2029 ecl:blu cid:129 byr:1989\niyr:2014 pid:896056539 hcl:#a97842 hgt:165cm\n",
            "hcl:#888785\nhgt:164cm byr:2001 iyr:2015 cid:88\npid:545766238 ecl:hzl\neyr:2022\n",
            "iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719\n"
        ]

        valid_passports.each do |passport|
            assert is_valid(passport)
        end
    end
end
