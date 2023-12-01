STRNUMS = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}.freeze
REV_STRNUMS = STRNUMS.transform_keys(&:reverse).freeze

class AdventOfCode2023Day1
  class << self
    def part1(input)
      input.map { |num| extract_numbers(num) }.sum
    end

    def part2(input)
      input.map { |num| extract_str_numbers(num) }.sum
    end

    private

    def extract_numbers(input)
      a = input[/\d/]
      b = input.reverse[/\d/]

      "#{a}#{b}".to_i
    end

    def extract_str_numbers(input)
      a = input[/\d|#{STRNUMS.keys.join('|')}/]
      a = STRNUMS[a] || a
      b = input.reverse[/\d|#{REV_STRNUMS.keys.join('|')}/]
      b = REV_STRNUMS[b] || b

      "#{a}#{b}".to_i
    end

  end
end
