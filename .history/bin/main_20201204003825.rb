# frozen_string_literal: true

board_line = '+---+---+---+'
available_moves = (1..9).to_a

puts board_line
puts "| #{available_moves[0]} | #{available_moves[1]} | #{available_moves[2]} |"
puts board_line
puts "| #{available_moves[3]} | #{available_moves[4]} | #{available_moves[5]} |"
puts board_line
puts "| #{available_moves[7]} | #{available_moves[8]} | #{available_moves[9]} |"
puts board_line



p available_moves
turns_available = 3
while turns_available > 0
   puts "Type your next move: \n (moves available: #{available_moves.to_s}"
   turn = gets.chomp.to_i
   map_available = available_moves.reject {|a| a.to_i == turn.to_i}
   p turn
   if available_moves.length == map_available || turn == 0
      puts "Select an option from the available as shown"
      next
   else
      chosen = available_moves - map_available
      available_moves = available_moves - chosen
      available_moves_shown 
      # chosen_array += chosen_array.push(chosen)
      # p chosen_array
      turns_available -= 1
   #   next if chosen.length < 3 
   end
   # if
   # if winner # and/or draw (the exact condition in this milestone is not important)
end