require './lib/game_logic.rb'
available_moves = (1..9).to_a
available_moves_shown = available_moves

puts UserInterface.show_game_instructions
puts 'Chose the name of player_1'
name1 = gets.chomp.to_s
puts 'Chose the name of player_2'
name2 = gets.chomp.to_s

UserInterface.new(name1, name2)
LogicGame.new(UserInterface.players)
puts Board.gameboard()
while  LogicGame.keep_playing == true
puts UserInterface.show_who_play
puts UserInterface.choose()
LogicGame.game_play (gets.chomp.to_i)
puts Board.gameboard()
end
puts UserInterface.show_win_game

