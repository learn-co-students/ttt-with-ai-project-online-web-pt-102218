class Game
  attr_accessor :board, :player1, :player2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze

  def initialize(player1 = Players::Human.new('X'),
                 player2 = Players::Human.new('O'),
                 board = Board.new)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player1 : @player2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.taken?(combo[0] + 1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if (combo = won?)
      @winner = @board.cells[combo[0]]
    end
  end

  def turn
    player = current_player
    @board.display
    move = player.move(@board)
    if !@board.valid_move?(move)
      turn
    else
      @board.update(move, current_player)
    end
  end

  def play
    turn until over?
    @board.display
    puts draw? ? "Cat's Game!" : "Congratulations #{winner}!"
  end
end
