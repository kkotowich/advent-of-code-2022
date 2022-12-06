
require_relative '../classes/day_solver'

class Instruction

  attr_accessor :quantity
  attr_accessor :origin
  attr_accessor :target

  def initialize (quantity, origin, target)
    @quantity = quantity
    @origin = origin
    @target = target
  end
end

class Day5 < DaySolver
  def initialize
    super(day = 5)
  end

  def solve() 
    data = @api.getDailyInput()

    layoutData = []
    instructionData = []
    length = 0
    
    input_section = 1
    data.each do |line|
      if line == "\n"
        input_section = 2
        length = layoutData.pop().split(" ")[-1].to_i
        next
      end

      if input_section == 1
        layoutData.push(line)
      else
        instructionData.push(line)
      end
    end

    layout = []
    for i in (0...length)
      layout.push([])
      
      layoutData.each do |line|
        symbolIndex = (i*3)+(1*(i+1))

        if line[symbolIndex] != " "
          layout[i].push(line[symbolIndex])
        end
      end
      layout[i] = layout[i].reverse()
    end

    instructions = []
    instructionData.each do |line|
      line_tokens = line.split(" ")
      instructions.push(
        Instruction.new(
          line_tokens[1].to_i,
          line_tokens[3].to_i - 1,
          line_tokens[5].to_i - 1))
    end

    @answer1 = solve_1(layout.map(&:clone), instructions)
    @answer2 = solve_2(layout.map(&:clone), instructions)
  end

  private
  def solve_1 (layout, instructions)
    instructions.each do |instruction|
      for i in (0...instruction.quantity)
        box = layout[instruction.origin].pop() 
        layout[instruction.target].push(box)
      end
    end

    return get_top_symbols(layout)
  end

  def solve_2 (layout, instructions)
    instructions.each do |instruction|
      cut_boxes = layout[instruction.origin][-instruction.quantity, instruction.quantity]
      layout[instruction.target] = layout[instruction.target] + cut_boxes
      layout[instruction.origin] = layout[instruction.origin][0...-instruction.quantity]
    end

    return get_top_symbols(layout)
  end

  def get_top_symbols(layout)
    topSymbols = []
    layout.each do |stack|
      topSymbols.push(stack[-1])
    end

    return topSymbols.join("")
  end

end

start = Time.now

day = Day5.new()
day.solve()

puts "answer 1: #{day.answer1}"
puts "answer 2: #{day.answer2}"

## UNCOMMENT WHEN READY TO SUBMIT ##
# day.submitAnswer1()
# day.submitAnswer2()

finish = Time.now
diff = finish - start
puts "processing time: #{diff}"