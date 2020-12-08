# rubocop: disable Metrics/MethodLength,Style/ClassVars, Metrics/LineLength, Metrics/PerceivedComplexity
require "colorize"
class UserInterface

  def self.players
    @@players
  end

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @@players = []
    @@players << @name1
    @@players << @name2
    return "you are #{@name1} your mark is (X) and you choose go vs #{@name2} his mark is (O)"
  end

  def self.show_game_instructions
    return  "Welcome! \n This is our Tic-Tac-Toc Game \n For this game you will need THE AMAZING INSTRUCTIONS: \n The game start in a grid table of 3x3 cells with numbers.\n You will be 2 players, the player 1 play first, and the second... play second, one turn by one, choosing what number play \n You need complete a line (horizontal, vertical or diagonal) with 3 grid-cells or numbers\n".green
  end
  
  def self.show_who_play ()
   return LogicGame.who_play?()
  end
  
  def self.choose()
    @turn = LogicGame.turn
    return "you choose #{@turn}".blue
    
  end

  def self.invalid_move?()
    return 'You choose an unvalid option, please try again and select an option from the available as shown'.red 
  end

  def self.show_win_game
    n = if !LogicGame.player_winner.nil?
          LogicGame.player_winner
        else
          "It's a draw"
        end
    n
  end
end

class LogicGame
  @@rows_cols = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  @@chosen_p1 = []
  @@chosen_p2 = []
  @@turns_available = 9
  @@available_moves = (1..9).to_a
  @@available_moves_shown = @@available_moves
  @@turn=0
  @@win=false
  
  def initialize(numb)
    @@players = numb
    @@player_winner = []
  end
  
  

  def self.who_play?()
    if @@turns_available.odd?
    return "Ready #{@@players[0]}: \n (moves available: #{@@available_moves}".light_red
  else
    return "Ready #{@@players[1]}: \n (moves available: #{@@available_moves}".light_green
  end
end

  def self.game_play(turn)
    @@turn=turn
    @turn=turn
    @@available_moves_shown=@@available_moves_shown   
      @map_available = @@available_moves.reject { |a| a.to_i == turn.to_i }
      
       if @@available_moves.length == @map_available.length || turn.zero?
        return UserInterface.invalid_move?
        Board.gameboard()
      else
        available_moves_shown = Board.board_modf(@@available_moves, @map_available, @@available_moves_shown, @@turns_available)
        Board.gameboard()
        @@turns_available -= 1
        @@win = comparing_players(@win) if @@chosen_p1.size >= 3
      end
    
    @@win
  end

  def self.comparing_players(win)
    @@rows_cols.each do |n_row|
      count1 = 0
      count2 = 0
      n_row.each do |n|
        if @@chosen_p1.include?(n)
          count1 += 1
        elsif @@chosen_p2.include?(n)
          count2 += 1
        else
          count1 = 0
          count2 = 0
        end
        @@win = true unless chossing_winner(count1, count2).nil?
      end
    end
    @@win
  end

  def self.player_winner
    @@player_winner
  end

  def self.chossing_winner(count1, count2)
    if count1 > 2
      player_winner = "#{@@players[0]} win"
    elsif count2 > 2
      player_winner = " #{@@players[1]} win"
    end
    @@player_winner = player_winner
    @@player_winner
  end

  def self.available_moves_shown
    @@available_moves_shown
  end

  def self.chosen_p1
  @@chosen_p1
  end
  def self.chosen_p2
  @@chosen_p2
  end
  def self.turn
    @@turn
  end
  
   def self.keep_playing()
   
    if @@win==false && !@@turns_available.zero?
     
      return true
   else
     false
   end
   end

end


class Board

  @@available_moves_shown = LogicGame.available_moves_shown
  @@chosen_p1 = LogicGame.chosen_p1
  @@chosen_p2= LogicGame.chosen_p2
  def self.board_modf(available_moves, map_available, available_moves_shown, turns_available)
    @turns_available = turns_available
    @available_moves = available_moves
    @map_available = map_available
    chosen = @available_moves - @map_available
    if @turns_available.odd?
      @@chosen_p1 << chosen[-1]
      available_moves_shown[chosen[-1] - 1] = 'X'
    else
      @@chosen_p2 << chosen[-1]
      available_moves_shown[chosen[-1] - 1] = 'O'
    end
    available_moves_shown
  end

  def self.gameboard()
    available_moves_shown=@@available_moves_shown
    board_line = '+---+---+---+'
    
    " #{board_line}\n | #{available_moves_shown[0]} | #{available_moves_shown[1]} | #{available_moves_shown[2]} |\n #{board_line}\n | #{available_moves_shown[3]} | #{available_moves_shown[4]} | #{available_moves_shown[5]} |\n #{board_line}\n | #{available_moves_shown[6]} | #{available_moves_shown[7]} | #{available_moves_shown[8]} |\n #{board_line}".cyan
  end
end

# rubocop: enable Metrics/MethodLength,Style/ClassVars, Metrics/LineLength, Metrics/PerceivedComplexity
