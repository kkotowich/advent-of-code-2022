require_relative '../classes/day_solver'

class Weapon

  WIN = 6
  DRAW = 3
  LOSE = 0
  
  attr_accessor :name

  def initialize (name, self_points, beats, beaten_by)
    @name = name
    @self_points = self_points
    @beats = beats
    @beaten_by = beaten_by
  end

  def battle(enemy_name)
    battle_points = LOSE

    if enemy_name == @name
      battle_points = DRAW
    elsif enemy_name == @beats
      battle_points = WIN
    end

    return battle_points + @self_points
  end
end

class Rock < Weapon
  def initialize
    super('rock', 1, 'scissors', 'paper')
  end

  def createEnemyWinner()
    return Paper.new()
  end

  def createEnemyLoser()
    return Scissors.new()
  end

  def createEnemyEqual()
    return Rock.new()
  end
end

class Paper < Weapon
  def initialize
    super('paper', 2, 'rock', 'scissors')
  end

  def createEnemyWinner()
    return Scissors.new()
  end

  def createEnemyLoser()
    return Rock.new()
  end

  def createEnemyEqual()
    return Paper.new()
  end
end

class Scissors < Weapon
  def initialize
    super('scissors', 3, 'paper', 'rock')
  end

  def createEnemyWinner()
    return Rock.new()
  end

  def createEnemyLoser()
    return Paper.new()
  end

  def createEnemyEqual()
    return Scissors.new()
  end
end

class Day2 < DaySolver
  def initialize
    super(day = 2)
  end

  def solve() 
    data = @api.getDailyInput()
    
    @answer1 = solve_1(data)
    @answer2 = solve_2(data)
  end

  private
  def solve_1 (data)
    rounds = []
    data.each do |round|
      tokens = round.split(" ")

      enemy_weapon = createWeapon(tokens[0])
      self_weapon = createWeapon(tokens[1])
      

      rounds.push([enemy_weapon, self_weapon])
    end

    ## ANSWER 1
    score = 0
    rounds.each do |round|
      score += round[1].battle(round[0].name)
    end
    
    return score
  end

  def solve_2 (data)
    rounds = []
    data.each do |round|
      tokens = round.split(" ")

      enemy_weapon = createWeapon(tokens[0])
      self_weapon = sneakilyCreateWeapon(enemy_weapon, tokens[1])

      rounds.push([enemy_weapon, self_weapon])
    end

    score = 0
    rounds.each do |round|
      score += round[1].battle(round[0].name)
    end
    
    return score
  end
    
  def createWeapon(symbol) 
    if symbol == 'A' || symbol == 'X'
      return Rock.new()
    elsif symbol == 'B' || symbol == 'Y'
      return Paper.new()
    elsif symbol == 'C' || symbol == 'Z'
      return Scissors.new()
    end
  end

  # Create a weapon for the desired outcome based on enemy weapon
  def sneakilyCreateWeapon(enemy, desired_outcome) 
    if desired_outcome == 'X'
      # Player wants to LOSE
      return enemy.createEnemyLoser()
    elsif desired_outcome == 'Y'
      # Player wants to DRAW
      return enemy.createEnemyEqual()
    elsif desired_outcome == 'Z'
      # Player wants to WIN
      return enemy.createEnemyWinner()
    end
  end
end

start = Time.now

day = Day2.new()
day.solve()

puts "answer 1: #{day.answer1}"
puts "answer 2: #{day.answer2}"

## UNCOMMENT WHEN READY TO SUBMIT ##
# day.submitAnswer1()
# day.submitAnswer2()

finish = Time.now
diff = finish - start
puts "processing time: #{diff}"