class Piece

  def initialize #(symbol, board)
    # @color = symbol
    # @board = board
    # @pos = []
  end

  def moves
    @pos
  end
end

class Rook < Piece
end


class NullPiece < Piece
end
