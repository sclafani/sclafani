puts "You have entered in a horse race"
puts "Enter Horse Name"
horse_name = gets.chomp
horses = []
while horse_name != ""
  horses << horse_name
  puts "Enter next horse's name or hit enter to begin the race"
  horse_name = gets.chomp
end
puts "The race has begun"
puts "The current leader is #{horses.shuffle[0]}"
puts "The race is over and the order results are:"
results = horses.shuffle
results.each_with_index { |horse, place| puts "#{place + 1} - #{horse}" }
