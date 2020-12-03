board_line = "+---+---+---+"

puts board_line
puts "|#{" 1 "}|#{" 2 "}|#{" 3 "}|"
puts board_line
puts "|#{" 4 "}|#{" 5 "}|#{" 6 "}|"
puts board_line
puts "|#{" 7 "}|#{" 8 "}|#{" 9 "}|"
puts board_line

def turns(move)
   raise LocalJumpError if !move.is_a? Integer && (0 < move < 10)
   number_of_turns = 3
   while number_of_turns do 
      puts "Type your move: "
      turn = gets.chomp
      number_of_turns -= 1
   end

puts "Type your first move: "
turn_1 = gets.chomp
puts "Type your second move: "
turn_2 = gets.chomp
puts "Type your third move: "
turn_3 = gets.chomp

# class Turns
#    attr_accessor :name, :position
#    def initialize(name, position)
#       @name = name
#       @position = position
#       # self.split("_")
