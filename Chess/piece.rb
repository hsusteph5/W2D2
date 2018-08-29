require_relative 'module'
require 'singleton'

class Piece
  def initialize (symbol, board, pos)
    @color = symbol
    @board = board
    @pos = []
  end

  def moves
    @pos
  end
end

class Rook < Piece
  include SlideablePiece

  def symbol
  end

#telling it what moves it can do
  def move_dirs
    horizontal_dirs
  end
end

class Bishop < Piece
  include SlideablePiece

  def move_dirs
    diagonal_dirs
  end

end

class Queen < Piece
  include SlideablePiece

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

end

class NullPiece < Piece
  include singleton
  attr_reader :color, :symbol

  def initialize
    @color = symbol
  end
end
