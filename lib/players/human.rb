module Players
  class Human < Player
  
    def move(cells)
      move = gets.chomp.strip
      move
    end
  end
end