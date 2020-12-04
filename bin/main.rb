require './lib/game_logic.rb'
available_moves = (1..9).to_a
available_moves_shown = available_moves

UserInterface.show_game_instructions
puts 'How much players are going to play 1 or 2'
n=UserInterface.new(gets.chomp.to_i)
puts 'Chose the name of player_1'
name1 = gets.chomp.to_s
puts 'Chose the name of player_2'
name2 = gets.chomp.to_s

UserInterface.player_name(name1, name2)
UserInterface.player_select
LogicGame.new(UserInterface.players)
LogicGame.gameboard(available_moves_shown)
p available_moves
turns_available = 9

LogicGame.game_play(turns_available)

# rubocop: enable Metrics/BlockNesting
