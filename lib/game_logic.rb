class UserInterface
 
  def self.players
  @@players
  end

   def initialize (n_users)
     @players=[]
     @@players=[]
     @@users=n_users
   end
 
   def self.player_name (name1=@player_1,name2=@player_2)
    
     p @@users.is_a?(Integer)
    
     if @@users == 1
       @name1 = name1
     else
     
       @name1=name1
       @name2=name2
     end
   end
 
   def self.player_select()
     if @@users == 1
       @player_1 = @name1
       @player_2="computer"
     else
       @player_1= @name1
       @player_2= @name2
     end
     puts "you are #{@player_1} and you choose go vs #{@player_2}"
     @@players<<@player_1
     @@players<<@player_2
   end
  
   def self.show_game_instructions()
     puts "Welcome! \n This is our Tic-Tac-Toc Game"
   end
   
   def show_invalid_move
     
   end
 
   def show_win_game
     
   end
 
   
 
 end

#  =begin
 
#  class player
 
#    def player_name
     
#    end
 
#    def arrays_player
 
#    end
 
#  end
 
  class LogicGame
    @@turns_available = 9
    def initialize(n)
      @@players=n
    end

    def self.gameboard(available_moves_shown)
      board_line = '+---+---+---+'
      puts board_line
      puts "| #{available_moves_shown[0]} | #{available_moves_shown[1]} | #{available_moves_shown[2]} |"
      puts board_line
      puts "| #{available_moves_shown[3]} | #{available_moves_shown[4]} | #{available_moves_shown[5]} |"
      puts board_line
      puts "| #{available_moves_shown[6]} | #{available_moves_shown[7]} | #{available_moves_shown[8]} |"
      puts board_line
    end
    
    def self.game_play()
      win = false
      available_moves = (1..9).to_a
      available_moves_shown = available_moves
      rows_cols = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
      chosen_p1 = []
      chosen_p2 = []
      while win == false && !@@turns_available.zero?
        if @@turns_available.odd?
          puts "Ready #{@@players[0]}: \n (moves available: #{available_moves}"
        else
          puts "Ready #{@@players[1]}: \n (moves available: #{available_moves}"
        end
        turn = gets.chomp.to_i
        map_available = available_moves.reject { |a| a.to_i == turn.to_i }
        puts "you choose #{turn}"
        if available_moves.length == map_available.length || turn.zero?
          puts 'Select an option from the available as shown'
          gameboard(available_moves_shown)
          next
        else
          chosen = available_moves - map_available
          available_moves -= chosen
          if @@turns_available.odd?
            chosen_p1 << chosen[-1]
            available_moves_shown[chosen[-1] - 1] = 'X'
          else
            chosen_p2 << chosen[-1]
            available_moves_shown[chosen[-1] - 1] = 'O'
          end
          gameboard(available_moves_shown)
          @@turns_available -= 1
          if chosen_p1.size >= 3
            rows_cols.each do |n_row|
              count1 = 0
              count2 = 0
              n_row.each do |n|
                if chosen_p1.include?(n)
                  count1 += 1
                elsif chosen_p2.include?(n)
                  count2 += 1
                else
                  count1 = 0
                  count2 = 0
                end
                if count1 > 2
                  p 'win'
                  win = true
                elsif count2 > 2
                  p ' player 2 win'
                  win = true
                end
              end
            end
        
            end
           
          end
      
        
      end
      p "It's a draw" if win == false
    end
 
    def array_modification
     
    end
 
    def comparing_players
    end
 
    def computer_not_looser
     
    end
 
  end
 
 
#  x = UserInterface.new(2)
  
 
#  x.player_name("juan")
#  x.player_select

#  =end
 