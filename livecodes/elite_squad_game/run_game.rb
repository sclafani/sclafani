system "clear"
require_relative 'game'

puts "|=============================================|"
puts "|======== ELITE SQUAD GAMES PRESENTS =========|"
puts "|=============================================|"
puts "|====== CAN YOUR SURVIVE THE BOOTCAMP ? ======|"
puts "|=============================================|"

puts "What's your name?"

name = gets.chomp

me = Student.new(name)

puts "HELLO #{me.name.upcase} YOU START YOUR BOOTCAMP IN ....\n"
sleep 1
puts "3"
sleep 1
puts "2"
sleep 1
puts "1"
sleep 1
puts "NOW"
puts ""

while me.day <= 35 && me.think_thomas_cool
  me.next_day!
  sleep 1
end
