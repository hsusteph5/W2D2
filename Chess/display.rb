require 'colorize'
require_relative "board"
require_relative "cursor"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    8.times do |r|
      8.times do |c|
        #check if it is a cursor position
        if @cursor.cursor_pos == [r, c]
          unless @board.grid[r][c].is_a?(NullPiece)
            print '  p  '.colorize(:background => :light_cyan )
          else
            print "     ".colorize(:background => :light_cyan )
          end
        else
          unless @board.grid[r][c].is_a?(NullPiece)
            print '  p '
          else
            print "     "
          end
        end
      end
      puts
      puts
    end
  end

  def test
    until false
      system('clear')
      render
      puts @cursor.cursor_pos
      @cursor.get_input
    end
  end
end
