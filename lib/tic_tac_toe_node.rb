require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    ans = []
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |col, k|
        if @board.empty?([i,k])
          new_board = @board.dup
          new_node = TicTacToeNode.new(new_board, :x, [row, col])
          ans << new_node
        end
      end
    end
    return ans

  end

end
