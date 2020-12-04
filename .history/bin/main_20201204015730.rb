# frozen_string_literal: true

board_line = '+---+---+---+'
available_moves = (1..9).to_a
available_moves_shown = available_moves
rows_cols = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

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
turns_available = 6
while turns_available > 0
   if turns_available.even?
      puts "Ready Player One: \n (moves available: #{available_moves.to_s}"
   else
      puts "Ready Player Two: \n (moves available: #{available_moves.to_s}"
   end
      turn = gets.chomp.to_i
   map_available = available_moves.reject {|a| a.to_i == turn.to_i}
   p turn
   if available_moves.length == map_available.length || turn == 0  
      puts "Select an option from the available as shown"
      gameboard(available_moves_shown)
      next
   else
      chosen = available_moves - map_available
      available_moves = available_moves - chosen
      if turns_available.even?
         chosen_p1 = chosen
         available_moves_shown[chosen[-1] - 1] = "X"
      else
         chosen_p2 = chosen
         available_moves_shown[chosen[-1] - 1] = "O"
      end
      gameboard(available_moves_shown)
      turns_available -= 1
      if chosen_p1.length == 3 || chosen_p2.length == 3
         chosen_p1.sort
         chosen_p2.sort
         arr = []
         i = 0
         for i in rows_cols[i]
            p chosen_p1.sort
            p rows_cols[i]
            if (chosen_p1 - rows_cols[i] == arr)
               p "PLAYER 1 WINS"
            elsif
             (chosen_p1 - rows_cols[i] == arr)

            else
               p "you lose"
            end
   end
   puts "It's a DRAW"
end

chosen_p1 = [5, 4, 3]

arr = []
i = 0
for i in rows_cols[i]
   p chosen_p1.sort
   p rows_cols[i]
   if (chosen_p1 - rows_cols[i] == arr)
      p "You win"
   else
      p "you lose"
   end
end

