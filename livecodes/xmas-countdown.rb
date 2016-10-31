require 'date'

def xmas_countdown(day = Date.today)
  return (Date.new((day + 6).year, 12, 25) - day).to_i
end

p xmas_countdown
p xmas_countdown(Date.new(2016, 12, 29))
p xmas_countdown(Date.new(2018, 3, 5))
