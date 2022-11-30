# Copy this file to use as a starter for each day
# mkdir day1 && cp ./day_example.rb ./day1/day1.rb

require_relative '../classes/day_solver'

## RENAME THE CLASS ##
class DayExample < DaySolver
  def initialize
    ## SET THE DAY ##
    super(day = 1)
  end

  def solve() 
    data = @api.getDailyInput()
  
    # example: transform data, type conversion, etc.
    data.map! do |line|
      line.delete_prefix("+")
      line.to_i
    end

    # solve the rest...
     
    # assign the answer
    @answer1 = 42
    @answer2 = 84
  end
end

start = Time.now

day = DayExample.new()
day.solve()

puts "answer 1: #{day.answer1}"
puts "answer 2: #{day.answer2}"

finish = Time.now
diff = finish - start
puts "processing time: #{diff}"

## UNCOMMENT WHEN READY TO SUBMIT ##
# day.submitAnswer1()
# day.submitAnswer2()