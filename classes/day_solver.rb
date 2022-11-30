require_relative '../helpers/api'

class DaySolver

  attr_accessor :answer1
  attr_accessor :answer2

  def initialize (day)
    ## SET THE DAY ##
    @day = day

    @api = API.new(@day)
    @answer1 = nil
    @answer2 = nil
  end

  def solve() 
    puts "method not yet implemented"
  end
  
  def printAnswers() 
    printAnswer1()
    printAnswer2()
  end

  def printAnswer1()
    puts "answer 1: #{day.answer1}"
  end

  def printAnswer2()
    puts "answer 2: #{day.answer2}"
  end

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