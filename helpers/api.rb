require 'net/http'
require_relative './file'

class API
  def initialize (day = 1, year = 2022)
    @year = year
    @day = day
    @baseUrl = 'https://adventofcode.com'
    @projectDirectory = "/Users/kylekotowich/workspace/advent-of-code-2022"
    @dayDirectory
  end
end

public 
def getDailyInput()
  if (File.file?("#{@projectDirectory}/day#{@day}/input.txt"))
    return FileHelper.getDailyInput("/day#{@day}/input.txt")
  end

  uri = URI(@baseUrl)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  
  response = http.get("/#{@year}/day/#{@day}/input", { 'Cookie' => 'session=53616c7465645f5f9193805b3c33c88101f0c2caa6bc7959444f34efa2361c2aa1feeb89191f7a2a946f6273f8bd21dd47dac65e65c64c6010087c91a208f912' })

  data = response.body.split(" ")

  # write to file for faster retrieval
  FileHelper.writeDailyInput("/day#{@day}/input.txt", data)

  return data
end

def submitAnswer(level, answer)
  uri = URI(@baseUrl)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  
  response = http.post(
    "/#{@year}/day/#{@day}/answer",
    "level=#{level}&answer=#{answer}",
    { 'Cookie' => 'session=53616c7465645f5f9193805b3c33c88101f0c2caa6bc7959444f34efa2361c2aa1feeb89191f7a2a946f6273f8bd21dd47dac65e65c64c6010087c91a208f912' }
  )

  # TODO: parse response body for error/success
  return response.body
end
