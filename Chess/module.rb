
module SlideablePiece
  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIR
  end

  def moves
  end

  private
  #right, left, down, up
  HORIZONTAL_DIRS = [[0,1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIR = [[1,1], [1, -1], [-1, 1], [-1, -1]]
  def move_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end

  private

end
