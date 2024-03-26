require 'httparty'

def timezone_converter(area, location)
  response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")

  timezones = JSON.parse(response.body)
  date = timezones['datetime'][0, 10]
  time = timezones['datetime'][11, 8]

  puts "The current time in #{area}/#{location} is #{date} #{time}"
end

timezone_converter('Europe', 'London')
