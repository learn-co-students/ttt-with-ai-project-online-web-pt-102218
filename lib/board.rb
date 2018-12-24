class Board
  
  attr_accessor :cells
  
  def initialize
    self.cells = Array.new(9, " ")
  end
  
  def reset!
    self.cells = Array.new(9, " ")
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    @cells[input.to_i-1]
  end
  
  def full?
    if @cells.include?(" ")
      return false
    else
      return "truthy value"
    end
  end
  
  
  def turn_count
    @cells.count("X") + @cells.count("O")
  end
  
  def taken?(input)
    if @cells[input.to_i - 1] == " "
      return false
    else
      true
    end
  end
  
  def valid_move?(input)
    if @cells[input.to_i - 1] == " " && input.to_i.between?(1,9)
      return true
    end
  end
  
  def update(token, player)
    @cells[token.to_i - 1] = "X" || "O"
  end
      
  
end