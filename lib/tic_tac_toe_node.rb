require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if self.board.over?
      if self.board.winner != evaluator && self.board.won?
        return true
      else
        return false
      end
    end

    if evaluator == self.next_mover_mark
      self.children.all? { |child| child.losing_node?(evaluator) }
    else
      self.children.any? { |child| child.losing_node?(evaluator) }
    end
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
          new_position = [i,k]
          new_board = @board.dup
          #Below line was the bit of code that broke everything
          new_board[new_position] = self.next_mover_mark
          new_mark = self.next_mover_mark == :x ? :o : :x
          new_node = TicTacToeNode.new(new_board, new_mark, new_position)
          ans << new_node
        end

      end
    end

    return ans
  end

end
