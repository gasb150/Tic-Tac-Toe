require './lib/game_logic.rb'
available_moves = (1..9).to_a
available_moves_shown = available_moves

UserInterface.show_game_instructions
puts 'How much players are going to play 1 or 2'
n=gets.chomp.to_i
UserInterface.new(n)


if n == 1
  puts 'Chose the name of player_1'
  name1 = gets.chomp.to_s
elsif n == 2
  puts 'Chose the name of player_1'
  name1 = gets.chomp.to_s
  puts 'Chose the name of player_2'
  name2 = gets.chomp.to_s
end

UserInterface.player_name(name1, name2)
UserInterface.player_select
LogicGame.new(UserInterface.players)
LogicGame.gameboard(available_moves_shown)
LogicGame.game_play()

# rubocop: enable Metrics/BlockNesting
