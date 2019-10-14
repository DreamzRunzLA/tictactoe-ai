require_relative 'tic_tac_toe'

class TicTacToeNode
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

    @board.each do |row|
      @row.each do |col|
        if @board[row][col].empty?
          new_board = @board.dup
          
        end
      end
    end
  end
end

`bundle exec rspec spec/01_tic_tac_toe_node_spec.rb`
`bundle exec rspec spec/02_super_computer_player_spec.rb`