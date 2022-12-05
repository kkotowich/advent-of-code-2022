
require_relative '../classes/day_solver'

class Day3 < DaySolver
  def initialize
    super(day = 3)
    
    @priority_map = make_priority_map()
  end

  def solve() 
    data = @api.getDailyInput()

    data.map! do |rucksack|
      rucksack.strip().split("")
    end
    
    @answer1 = solve_1(data)
    @answer2 = solve_2(data)
  end

  private
  def solve_1 (rucksacks)
    priority_sum = 0
    
    rucksacks.each do |rucksack|  
      compartment_1, compartment_2 = rucksack.each_slice(rucksack.length/2).to_a()

      shared_item = nil
      compartment_1.each do |item_from_c1|
        compartment_2.each do |item_from_c2|
          if item_from_c1 == item_from_c2
            shared_item = item_from_c1
            break
          end
        end
      end

      priority_sum += @priority_map[:"#{char}"]

    end
    
    return priority_sum
  end

  def solve_2 (data)

    data.each do |round|
    end
    
    return 0
  end
 
  # a-z => 1-26, A-Z => 27-52
  def make_priority_map
    alphabet = 'abcdefghijklmnopqrstuvwxyz'.split("")
    priority_map = {}
    alphabet.each_with_index do |character, index|
      priority_map[:"#{character}"] = index+1
    end

    alphabet.each_with_index do |character, index|
      priority_map[:"#{character.upcase}"] = index+27
    end

    return priority_map
  end
end

start = Time.now

day = Day3.new()
day.solve()

puts "answer 1: #{day.answer1}"
puts "answer 2: #{day.answer2}"

## UNCOMMENT WHEN READY TO SUBMIT ##
# day.submitAnswer1()
# day.submitAnswer2()

finish = Time.now
diff = finish - start
puts "processing time: #{diff}"