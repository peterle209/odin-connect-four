# frozen_string_literal: true

class Board
  COLUMNS = 7
  ROWS = 6

  def initialize
    @board = Array.new(Board::COLUMNS) { [] }
  end

  def fill_column(column)
    @board[column].push('Y')
  end

  def full_column?(column)
    return true if @board[column].size == ROWS

    false
  end

  def clear
    @board.each(&:clear)
  end
end
