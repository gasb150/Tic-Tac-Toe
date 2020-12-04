# frozen_string_literal: true

board_line = '+---+---+---+'

puts board_line
puts '| 1 | 2 | 3 |'
puts board_line
puts '| 4 | 5 | 6 |'
puts board_line
puts '| 7 | 8 | 9 |'
puts board_line

puts 'Type your first move: '
turn1 = gets.chomp
puts "Your move #{turn1} was displayed\n\n"
puts 'Type your second move: '
turn2 = gets.chomp
puts "Your move #{turn2} was displayed\n\n"
puts 'Type your third move: '
turn3 = gets.chomp
puts "Your move #{turn3} was displayed\n\n"



game_on = true
available_moves = [1,2,3,4,5,6,7,8,9]
turns_available = 3
while game_on
   game_on = false if turns_available == 0
   puts 'Type your next move: \n #'
   turn = gets.chomp
   turns_available -= 1
   game_on = false
   
   # if winner # and/or draw (the exact condition in this milestone is not important)
end