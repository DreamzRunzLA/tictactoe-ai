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

    #SOLUTION BELOW
    # if board.over?
    #   # Note that a loss in this case is explicitly the case where the
    #   # OTHER person wins: a draw is NOT a loss. Board#won? returns
    #   # false in the case of a draw.
    #   return board.won? && board.winner != evaluator
    # end

    # if self.next_mover_mark == evaluator
    #   # If it's the turn of the 'evaluator', and no matter where we
    #   # move the opponent can force a loss, then this is already a
    #   # lost node.
    #   self.children.all? { |node| node.losing_node?(evaluator) }
    # else
    #   # If it's the opponent's turn, and they have any move where they
    #   # can eventually force a loss, we assume that the opponent play
    #   # perfectly and will take that move and eventually beat us.
    #   self.children.any? { |node| node.losing_node?(evaluator) }
    # end
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
          new_mark = self.next_mover_mark == :x ? :o : :x
          new_position = [i,k]
          new_node = TicTacToeNode.new(new_board, new_mark, new_position)
          ans << new_node
        end

      end
    end

    return ans
  end

end
