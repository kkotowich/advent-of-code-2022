class EnvHelper

  @@projectDirectory = "/Users/kylekotowich/workspace/advent-of-code-2022"
  @@KEYS = {}

  File.foreach("#{@@projectDirectory}/.env") do |line| 
    keyValue = line.split("=")

    @@KEYS[:"#{keyValue[0]}"] = keyValue[1]
  end 

  def self.get(key)
    return @@KEYS[:"#{key}"]
  end
end
