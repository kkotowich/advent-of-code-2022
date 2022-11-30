# Copy this file to use as a starter for each day
# mkdir day1 && cp ./day_template.rb ./day1/day1.rb

require 'uri'
require 'net/http'
require_relative 'helpers/api'

class DaySolver

  attr_accessor :answer1
  attr_accessor :answer2

  def initialize
    ## SET THE DAY ##
    @day = 1

    @api = API.new()
    @answer1 = nil
    @answer2 = nil
  end

  def solve() 
    data = @api.getDailyInput(@day)
  
    data.map! do |line|
      # example: transform data, type conversion, etc.
      line.delete_prefix("+")
      line.to_i
    end

    # solve the rest...
     
    # assign the answer
    @answer1 = 42
    @answer2 = 84

  end
  
  ##
  def submitAnswer1()
    submit(1)
  end

  def submitAnswer2()
    submit(2)
  end

  private
  def submit(level)
    answer = level == 1 ? @answer1 : @answer2
    @api.submitAnswer(level, @answer)
  end
end

start = Time.now

day = DaySolver.new()
day.solve()

puts "answer 1: #{day.answer1}"
puts "answer 2: #{day.answer2}"

finish = Time.now
diff = finish - start
puts "processing time: #{diff}"

## UNCOMMENT WHEN READY TO SUBMIT ##
# day.submitAnswer1()
# day.submitAnswer2()