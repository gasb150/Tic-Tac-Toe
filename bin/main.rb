require './lib/game_logic.rb'
available_moves = (1..9).to_a
available_moves_shown = available_moves

UserInterface.show_game_instructions


  puts 'Chose the name of player_1'
  name1 = gets.chomp.to_s
  puts 'Chose the name of player_2'
  name2 = gets.chomp.to_s


UserInterface.new(name1, name2)
LogicGame.new(UserInterface.players)
LogicGame.gameboard(available_moves_shown)
LogicGame.game_play()
puts UserInterface.show_win_game()

# rubocop: enable Metrics/BlockNesting
