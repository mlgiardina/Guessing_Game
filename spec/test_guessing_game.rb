require 'test/unit'

class GuessingGameTest < Test::Unit::TestCase

  def test_computer_picks_random_number_less_than_100
    @computer_number = rand(100)
    assert(@computer_number <= 100)
  end

  def test_user_input

  end

end
