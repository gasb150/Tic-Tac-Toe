#!/usr/bin/env ruby
require_relative './lib/game_logic'
require 'colorize'
require 'colorized_string'

puts UserInterface.welcome
sleep 1
puts UserInterface.show_game_instr
puts 'Choose the name of player one: '
name1 = gets.chomp.to_s.upcase!
puts 'Choose the name of player two: '
name2 = gets.chomp.to_s.upcase!

UserInterface.new(name1, name2)
LogicGame.new(UserInterface.players)
puts UserInterface.show_players
puts Board.gameboard
n = true
while n == true
  puts UserInterface.show_who_play
  x = LogicGame.game_play gets.chomp.to_i
  puts UserInterface.choose
  puts x if x.is_a?(String)
  n = LogicGame.keep_playing
  puts Board.gameboard
end
puts UserInterface.show_win_game
