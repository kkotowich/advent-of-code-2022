class FileHelper

  @@projectDirectory = "/Users/kylekotowich/workspace/advent-of-code-2022"

  public
  def self.getDailyInput(filename)
    data = Array.new()
  
    File.foreach("#{@@projectDirectory}/#{filename}") do |line| 
      data.push(line)
    end
  
    return data
  end
  
  def self.writeDailyInput(filename, data)
    File.open("#{@@projectDirectory}/#{filename}", "w+") do |f|
      f.puts(data)
    end
  end
end
