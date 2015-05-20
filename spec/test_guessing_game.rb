require 'test/unit'
require_relative "../lib/guessing_game.rb"

class GuessingGameTest < Test::Unit::TestCase

  def test_computer_number
    game = GuessingGame.new
    game.new_computer_number
    assert(game.computer_number <= 100)
  end

  def test_compare_numbers
    game = GuessingGame.new
    game.user_guess = 10
    game.computer_number = 20
    result = game.compare_numbers
    assert_equal("Your guess was too low. Guess again.", result)
  end

  def test_guess_counter
    game = GuessingGame.new
    game.guess_counter = 6
    result = game.check_guess_counter
    assert_equal("You lose.", result)
  end

end
