module SlideablePiece
  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIR
  end

#valid moves
  def moves
    moves = []
    # [[0,1], [0, -1], [1, 0], [-1, 0]]
    move_dirs.each do |arr| #[0,1]
      moves += grow_unblocked_moves_in_dir(arr[0], arr[1])
    end
    moves
  end

  private
  #right, left, down, up
  HORIZONTAL_DIRS = [[0,1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIR = [[1,1], [1, -1], [-1, 1], [-1, -1]]

  #empty method
  def move_dirs
    raise "AHHHH?!!!!!! The piece didn't take this method!"
  end

#go thorugh horizzonal_dir and diagonal_dir

  def grow_unblocked_moves_in_dir(dx, dy)
    #paste into the piece (reference pos)
    moves = []
    first, second = self.pos

    while (first >= 0 && first < 7) && (second < 7 && second >= 0)
      first += dx
      second += dy
      #comparing the color to self.color
      if @board.grid[first][second].color == self.color
        break
      #take the enemy pos, but break
      elsif @board.grid[first][second].color != self.color
        moves << [first, second]
        break
      elsif @board.grid[first][second].is_a?(NullPiece)
        move << [first, second]
      #checking in after you add negative, won't be off the board
      elsif (first >= 0 && first <= 7) && (second <= 7 && second >= 0)
        moves << [first, second]
      end
    end
    moves
  end

  private

end
