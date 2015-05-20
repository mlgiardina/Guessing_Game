require 'test/unit'
require_relative "../lib/guessing_game.rb"

class GuessingGameTest < Test::Unit::TestCase

  def test_computer_number
    game = GuessingGame.new
    game.new_computer_number
    assert(game.computer_number <= 100)
  end

  # def test_compare_numbers
  #   @computer_number = 50
  #   @user_guess = 10
  #   result = compare_numbers
  #   assert_equal(true, result)
  # end

end
