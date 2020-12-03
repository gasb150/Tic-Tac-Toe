board_line = "+---+---+---+"

puts board_line
puts "|#{" 1 "}|#{" 2 "}|#{" 3 "}|"
puts board_line
puts "|#{" 4 "}|#{" 5 "}|#{" 6 "}|"
puts board_line
puts "|#{" 7 "}|#{" 8 "}|#{" 9 "}|"
puts board_line

puts "Type your first move: "
turn_1 = gets.chomp
puts "Type your second move: "
turn_2 = gets.chomp
puts "Type your third move: "
turn_3 = gets.chomp

class Turns
   def initialize(position)
      @name = name
      @position = position
      # self.split("_")
