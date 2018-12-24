class Game
  
  attr_accessor :board, :player_1, :player_2, :winner, :user_input
  
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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    player_1 || player_2
  end
  
  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board.cells[combination[0]] == @board.cells[combination[1]] &&
        @board.cells[combination[1]] == @board.cells[combination[2]] &&
        @board.taken?(combination[0]+1)
        return combination
      end
    end
    return false
  end
  
  def draw?
    board.full? && !won? ? true : false
  end
  
  def over?
     (won? || draw?) ? true : false
     # IF board is not full, game is in progress (FALSE), ELSE, game is over (TRUE)
  end
  
  def winner
    #binding.pry
    if board.cells.count("X") > board.cells.count("O")
      return player_1.token
    elsif board.cells.count("X") == board.cells.count("O")
      return nil
    else
      return player_2.token
    end
  end
  
  def turn
    if !Board.full? && Board.valid_move? == true
      Board.update(position, player)
    end
  end
  
end