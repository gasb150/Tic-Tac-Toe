# frozen_string_literal: true

board_line = '+---+---+---+'

puts board_line
puts '| 1 | 2 | 3 |'
puts board_line
puts '| 4 | 5 | 6 |'
puts board_line
puts '| 7 | 8 | 9 |'
puts board_line



available_moves = (1..9).to_a
p available_moves
turns_available = 3
while turns_available > 0
   puts "Type your next move: \n (moves available: #{available_moves.to_s}"
   turn = gets.chomp.to_i
   map_available = available_moves.reject {|a| a.to_i == turn.to_i}
   map_available.to_a
   if available_moves.length == map_available
      puts "Select an option from the available as shown"
   else
      chosen += (available_moves - map_available)
      p chosen.to_a
      turns_available -= 1
   #   next if chosen.length < 3 
   end
   # if
   # if winner # and/or draw (the exact condition in this milestone is not important)
end