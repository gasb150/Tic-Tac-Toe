# frozen_string_literal: true

board_line = '+---+---+---+'

puts board_line
puts '| 1 | 2 | 3 |'
puts board_line
puts '| 4 | 5 | 6 |'
puts board_line
puts '| 7 | 8 | 9 |'
puts board_line



game_on = true
available_moves = (1..9).to_a
p available_moves
turns_available = 3
while game_on
   game_on = false if turns_available > 0
   puts "Type your next move: \n (moves available: #{available_moves.to_s}"
   turn = gets.chomp.to_i
   map_available = available_moves.reject {|a| a == turn.to_i}
   map_available = map_available.to_a
   puts map_available
   if available_moves[turn] == -1
      puts "Select an option from the available as shown"
   else
      chosen = available_moves - map_available
      chosen.to_
      available_moves = available_moves - chosen
      turns_available -= 1
   end
   
   # if winner # and/or draw (the exact condition in this milestone is not important)
end