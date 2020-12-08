# rubocop: disable Style/ClassVars, Metrics/LineLength, Style/GuardClause, Metrics/MethodLength
require 'colorize'
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
  end

  def self.show_players
    "\n#{@@players[0]}, your mark is (X)!\n\n#{@@players[1]}, your mark is (O)!\n\n".yellow
  end

  def self.welcome
    "
    ╔════╦══╦═══╗──╔════╦═══╦═══╗──╔════╦═══╦═══╗
    ║╔╗╔╗╠╣╠╣╔═╗║──║╔╗╔╗║╔═╗║╔═╗║──║╔╗╔╗║╔═╗║╔══╝
    ╚╝║║╚╝║║║║─╚╝──╚╝║║╚╣║─║║║─╚╝──╚╝║║╚╣║─║║╚══╗
    ──║║──║║║║─╔╗╔══╗║║─║╚═╝║║─╔╗╔══╗║║─║║─║║╔══╝
    ──║║─╔╣╠╣╚═╝║╚══╝║║─║╔═╗║╚═╝║╚══╝║║─║╚═╝║╚══╗
    ──╚╝─╚══╩═══╝────╚╝─╚╝─╚╩═══╝────╚╝─╚═══╩═══╝\n\n".magenta
  end

  def self.show_game_instr
    "Welcome!\n\n This is our Tic-Tac-Toc Game \n For this game you will need THE AMAZING INSTRUCTIONS: \n The game start in a grid table of 3x3 cells with numbers.\n You will be 2 players, the player 1 play first, and the second... play second, one turn by one, choosing what number play \n You need complete a line (horizontal, vertical or diagonal) with 3 grid-cells or numbers\n".yellow
  end

  def self.show_who_play
    LogicGame.who_play?
  end

  def self.choose
    @turn = LogicGame.turn
    "#{@turn} was chosen"
  end

  def self.invalid_move
    'Invalid key. Please try again with one of the options shown below'.red
  end

  def self.show_win_game
    if !LogicGame.player_winner.nil?
      LogicGame.player_winner
    else
      "IT'S A DRAW!".green
    end
  end
end

class LogicGame
  @@rows_cols = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  @@chosen_p1 = []
  @@chosen_p2 = []
  @@turns_avbl = 9
  @@avbl_moves = (1..9).to_a
  @@avbl_moves_shown = @@avbl_moves
  @@turn = 0
  @@win = false

  def initialize(numb)
    @@players = numb
    @@player_winner = []
  end

  def self.who_play?
    if @@turns_avbl.odd?
      "\nReady, #{@@players[0]}: \n (moves avbl: #{@@avbl_moves}".green
    else
      "\nReady, #{@@players[1]}: \n (moves avbl: #{@@avbl_moves}".magenta
    end
  end

  def self.game_play(turn)
    @@turn = turn
    @turn = turn
    @map_avbl = @@avbl_moves.reject { |a| a.to_i == turn.to_i }
    if @@avbl_moves.length == @map_avbl.length || turn.zero?
      return UserInterface.invalid_move
    else
      Board.board_modf(@@avbl_moves, @map_avbl, @@avbl_moves_shown, @@turns_avbl)
      Board.gameboard
      @@turns_avbl -= 1
      @@win = compare_players if @@chosen_p1.size >= 3
    end

    @@win
  end

  def self.compare_players
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
      @player_winner = "\n\n**** #{@@players[0]} WINS! ****\n\n".green
    elsif count2 > 2
      @player_winner = "\n\n**** #{@@players[1]} WINS! ****\n\n".green
    end
    @@player_winner = @player_winner
    @@player_winner
  end

  def self.avbl_moves_shown
    @@avbl_moves_shown
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

  def self.keep_playing
    true if @@win == false && !@@turns_avbl.zero?
  end
end

class Board
  @@avbl_moves_shown = LogicGame.avbl_moves_shown
  @@chosen_p1 = LogicGame.chosen_p1
  @@chosen_p2 = LogicGame.chosen_p2
  def self.board_modf(avbl_moves, map_avbl, avbl_moves_shown, turns_avbl)
    @turns_avbl = turns_avbl
    @avbl_moves = avbl_moves
    @map_avbl = map_avbl
    chosen = @avbl_moves - @map_avbl
    if @turns_avbl.odd?
      @@chosen_p1 << chosen[-1]
      avbl_moves_shown[chosen[-1] - 1] = 'X'
    else
      @@chosen_p2 << chosen[-1]
      avbl_moves_shown[chosen[-1] - 1] = 'O'
    end
    avbl_moves_shown
  end

  def self.gameboard
    avbl_moves_shown = @@avbl_moves_shown
    board_line = '+---+---+---+'

    " #{board_line}\n | #{avbl_moves_shown[0]} | #{avbl_moves_shown[1]} | #{avbl_moves_shown[2]} |\n #{board_line}\n | #{avbl_moves_shown[3]} | #{avbl_moves_shown[4]} | #{avbl_moves_shown[5]} |\n #{board_line}\n | #{avbl_moves_shown[6]} | #{avbl_moves_shown[7]} | #{avbl_moves_shown[8]} |\n #{board_line}".yellow
  end
end

# rubocop: enable Style/ClassVars, Metrics/LineLength, Style/GuardClause,  Metrics/MethodLength
