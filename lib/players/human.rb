module Players
  class Human < Player
    def move(board)
      puts "#{token}'s turn! Enter a valid move betwwen 1-9:"
      gets.strip
    end
  end
end
