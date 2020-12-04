# frozen_string_literal: true

board_line = '+---+---+---+'

puts board_line
puts '| 1 | 2 | 3 |'
puts board_line
puts '| 4 | 5 | 6 |'
puts board_line
puts '| 7 | 8 | 9 |'
puts board_line

puts 'Type your first move: '
turn = gets.chomp
puts "Your move #{turn_1} was displayed\n\n"
puts 'Type your second move: '
turn_2 = gets.chomp
puts "Your move #{turn_2} was displayed\n\n"
puts 'Type your third move: '
turn_3 = gets.chomp
puts "Your move #{turn_3} was displayed\n\n"
