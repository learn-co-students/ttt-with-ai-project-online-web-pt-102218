require "pry"

class Board
  attr_accessor :cells
  @@All = []
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(imput)
    
    imput = imput.to_i
    @cells[imput - 1]
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def full?
    if !@cells.include?(" ")
      true
    else
      false
    end
  end
  
  def turn_count
    turn = 0
    
    @cells.each do |x|
      if x != " "
        turn += 1
      end
    end
    turn
  end
  
  def taken?(num)
    num = num.to_i
    
    if @cells[num - 1] == "X" || @cells[num - 1] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(num)
    num = num.to_i
    
    if @cells[num - 1] == " " && num.between?(1, 9)
      true
    else
      false
    end
  end
  
  def update(num, player)
    num = num.to_i
    
    @cells[num - 1] = player.token
    
    #binding.pry
    
  end
  
end







