require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
  end
end

`bundle exec rspec spec/01_tic_tac_toe_node_spec.rb`
`bundle exec rspec spec/02_super_computer_player_spec.rb`