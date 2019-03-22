class Board
  attr_accessor :cells
  HR = '-----------'.freeze

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, ' ')
  end

  def display
    puts " #{cells[0..2].join(' | ')} "
    puts HR
    puts " #{cells[3..5].join(' | ')} "
    puts HR
    puts " #{cells[6..8].join(' | ')} "
  end

  def position(position)
    cells[position.to_i - 1]
  end

  def full?
    strip.length == 9
  end

  def turn_count
    strip.length
  end

  def taken?(position)
    cells[position.to_i - 1] != ' '
  end

  def valid_move?(position)
    position.to_i > 0 && !taken?(position)
  end

  def update(position, player)
    cells[position.to_i - 1] = player.token if valid_move?(position)
  end

  def strip
    cells.reject { |el| el == ' ' }
  end
end
