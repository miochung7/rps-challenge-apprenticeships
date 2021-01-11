class Play
  RANDOM = ["rock", "paper","scissors"].sample

  MOVES = {
    rock: { rock: :draw, paper: :lose, scissors: :win },
    paper: { rock: :win, paper: :draw, scissors: :lose },
    scissors: { rock: :lose, paper: :win, scissors: :draw }
  }
  attr_reader :player_1_move, :player_2_move

  def initialize(player_1_move, player_2_move = RANDOM)
    @player_1_move = player_1_move
    @player_2_move = player_2_move
  end

  def win?
    result == :win
  end

  private

  def result
    MOVES[[@player_1_move][@player_2_move]]
  end

end