# frozen_string_literal: true

board_line = '+---+---+---+'
available_moves = (1..9).to_a
available_moves_shown = available_moves

def gameboard(available_moves_shown) 
board_line = '+---+---+---+'
puts board_line
puts "| #{available_moves_shown[0]} | #{available_moves_shown[1]} | #{available_moves_shown[2]} |"
puts board_line
puts "| #{available_moves_shown[3]} | #{available_moves_shown[4]} | #{available_moves_shown[5]} |"
puts board_line
puts "| #{available_moves_shown[6]} | #{available_moves_shown[7]} | #{available_moves_shown[8]} |"
puts board_line
end

gameboard(available_moves_shown)

p available_moves
turns_available = 3
while turns_available > 0
   puts "Type your next move: \n (moves available: #{available_moves.to_s}"
   turn = gets.chomp.to_i
   map_available = available_moves.reject {|a| a.to_i == turn.to_i}
   p turn
   if turn.is_a? String || turn == 0
      puts "Select an option from the available as shown"
      next
   else
      chosen = available_moves - map_available
      available_moves = available_moves - chosen
      available_moves_shown[chosen[-1] - 1] = "X"
      gameboard(available_moves_shown)
      
      # chosen_array += chosen_array.push(chosen)
      # p chosen_array
      turns_available -= 1
   #   next if chosen.length < 3 
   end
   # if
   # if winner # and/or draw (the exact condition in this milestone is not important)
end