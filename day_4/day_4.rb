
require_relative '../classes/day_solver'

class Pairs

  attr_accessor :first
  attr_accessor :second

  def initialize(first, second)
    @first = first
    @second = second
  end
end
class Section

  attr_accessor :start
  attr_accessor :end

  def initialize (section_start, section_end)
    @start = section_start.to_i
    @end = section_end.to_i
  end

  def completely_overlaps?(other_section)
    return @start <= other_section.start && @end >= other_section.end
  end
end

class Day4 < DaySolver
  def initialize
    super(day = 4)
  end

  def solve() 
    data = @api.getDailyInput()
    
    pairs = []
    data.each do |line|
      pair_tokens = line.split(",")

      section_1_tokens = pair_tokens[0].split("-")

      # puts section_1_tokens[0]
      # puts section_1_tokens[1]
      
      section_1 = Section.new(section_1_tokens[0], section_1_tokens[1])

      # puts section_1.start
      # puts section_1.end
      
      section_2_tokens = pair_tokens[1].split("-")
      section_2 = Section.new(section_2_tokens[0], section_2_tokens[1])
      
      pairs.push(Pairs.new(section_1, section_2))

      # puts pairs[0].first.start
      # puts pairs[0].first.end
    end

    # puts pairs[157].first.start
    
    # @answer1 = solve_1([pairs[4]])
    @answer1 = solve_1(pairs)
    @answer2 = solve_2(pairs)
  end

  private
  def solve_1 (pairs)
    overlapCount = 0

    pairs.each do |pair|

      if (pair.first.completely_overlaps?(pair.second) || pair.second.completely_overlaps?(pair.first))
        overlapCount += 1
      else
        puts "#{pair.first.start}-#{pair.first.end},#{pair.second.start}-#{pair.second.end}"
      end
    end

    return overlapCount
  end



  def solve_2 (rucksacks)
    return 0
  end

end

start = Time.now

day = Day4.new()
day.solve()

puts "answer 1: #{day.answer1}"
puts "answer 2: #{day.answer2}"

## UNCOMMENT WHEN READY TO SUBMIT ##
# day.submitAnswer1()
# day.submitAnswer2()

finish = Time.now
diff = finish - start
puts "processing time: #{diff}"