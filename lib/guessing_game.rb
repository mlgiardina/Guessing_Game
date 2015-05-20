class GuessingGame

  def new_computer_number
    @computer_number = rand(100)
  end

  def start
    new_computer_number
    get_user_guess
    compare_numbers
  end

  def get_user_guess
    puts "Guess a number between 0 and 100."
    user_guess = gets.chomp.to_i
  end

  def compare_numbers
  end
end
