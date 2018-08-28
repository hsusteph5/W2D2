require_relative "piece.rb"

class Board
  def initialize
    @grid = Array.new(8){ Array.new(8)}
    populate
  end

  def populate
    self.grid.each_with_index do |rows, idx|
      if [0, 1, 6, 7].include?(idx)
        (0..7).each do |col|
          self.grid[idx][col] = Piece.new
        end
      else
        (0..7).each do |col|
          self.grid[idx][col] = NullPiece.new
         end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise ArgumentError.new('No piece at the start pos!')
    elsif self[end_pos].is_a?(Piece) && !self[end_pos].is_a?(NullPiece)
      raise ArgumentError.new('A piece is already at the position!')
    else
      moved_piece = self[start_pos]
      self[start_pos] = NullPiece.new
      self[end_pos] = moved_piece
    end
  end


  def valid_pos?(pos)
    if (0..7).to_a.include?(pos[0]) && (0..7).to_a.include?(pos[1])
      if self[pos].is_a?(NullPiece)
        return true
      end
    end
    false
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  # protected
  attr_accessor :grid

end
