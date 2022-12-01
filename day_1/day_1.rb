require_relative '../classes/day_solver'

class Day1 < DaySolver
  def initialize
    super(day = 1)
  end

  def solve() 
    data = @api.getDailyInput()
    
    data.map! do |calorie|
      calorie.to_i
    end

    ## ANSWER 1
    largestCalorieTotal = 0 
    elfCalorieTotal = 0
    elfCalorieTotals = Array.new()
    
    data.each do |calorie|  
      if calorie == 0
        if elfCalorieTotal > largestCalorieTotal
          largestCalorieTotal = elfCalorieTotal
        end
        
        elfCalorieTotals.push(elfCalorieTotal)
        elfCalorieTotal = 0
      else
        elfCalorieTotal += calorie
      end
    end
    
    ## ANSWER 2
    elfCalorieTotals.sort!
    largestThreeCalorieTotal = elfCalorieTotals[-1] + elfCalorieTotals[-2] + elfCalorieTotals[-3]
    
    ## END ##
    @answer1 = largestCalorieTotal
    @answer2 = largestThreeCalorieTotal
  end
end

start = Time.now

day = Day1.new()
day.solve()

puts "answer 1: #{day.answer1}"
puts "answer 2: #{day.answer2}"

## UNCOMMENT WHEN READY TO SUBMIT ##
# day.submitAnswer1()
# day.submitAnswer2()

finish = Time.now
diff = finish - start
puts "processing time: #{diff}"