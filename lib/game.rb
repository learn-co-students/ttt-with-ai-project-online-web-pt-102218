class Game
  
  attr_accessor :player_1, :player_2, :board, :winner

  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2] ]
    
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
  end
  
  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end
  
  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]] == 
         @board.cells[combination[2]] && @board.taken?(combination[0] + 1)
         return combination
       end
     end
     return false
  end
  
  def draw?
    board.full? && !won? ? true : false
  end
  
  def over?
    (draw? || won?) ? true : false
  end
  
  def winner
    if won?
      combination = won?
      @board.cells[combination[0]]
    end
  end
  
  def turn
    puts "Enter 1-9 to place your token"
    @board.display
    user_input = current_player.move(board)
    if @board.valid_move?(user_input)
      @board.update(user_input, current_player)
    else
      @board.display
      turn
    end
    @board.display
  end
  
  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def start_game
    start
    goodbye
  end
  
  def start
    puts "Welcome to Tic Tac Toe"
    puts "Choose what game type you would like to play:
    
    0 - Computer vs. Computer
    1 - Player vs Computer
    2 - Player vs. Player"
    
    player_mode = gets.strip
    
    if player_mode == "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), board = Board.new).play
    
      elsif player_mode == "1"
       puts "Would you like to be player_1 [y/n]"
        if gets.strip == "y"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), board = Board.new).play
        elsif gets.strip == "n"
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), board = Board.new).play
        end
      
      elsif player_mode == "2"
          Game.new(Players::Human.new("X"), Players::Human.new("O"), board = Board.new).play
      end
        
      puts "Would you like to play again [y/n] if 'n' type 'n' twice to exit"
        if gets.strip == "y"
        start_game
        elsif gets.strip == "n"
        exit
      end
    end
  
    def goodbye
      puts "Come back and play. Have a great day!"
    end
  end
