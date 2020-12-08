
require './lib/game_logic.rb'
require 'colorize'

puts UserInterface.show_game_instructions
puts 'Chose the name of player_1'.light_red
name1 = gets.chomp.to_s
puts 'Chose the name of player_2'.light_blue
name2 = gets.chomp.to_s

UserInterface.new(name1, name2)
LogicGame.new(UserInterface.players)
puts UserInterface.show_players
puts Board.gameboard
n = true
while  n == true
  puts UserInterface.show_who_play
  puts UserInterface.choose
  x = LogicGame.game_play gets.chomp.to_i
  puts x if x.is_a?(String)
  n = LogicGame.keep_playing
  puts Board.gameboard
end
puts UserInterface.show_win_game
