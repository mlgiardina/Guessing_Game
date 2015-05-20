class GuessingGame

  def initialize
    @still_playing = true
  end

  def new_computer_number
    @computer_number = rand(100)
  end

  def start
    new_computer_number
    get_user_guess
    while @still_playing == true
      compare_numbers
    end
  end

  def get_user_guess
    puts "Guess a number between 0 and 100."
    @user_guess = gets.chomp.to_i
  end

  def compare_numbers
    if @user_guess > @computer_number
      puts "Your guess was too high. Guess again."
      get_user_guess
    elsif @user_guess < @computer_number
      puts "Your guess was too low. Guess again."
      get_user_guess
    elsif @user_guess == @computer_number
      puts "That's correct. You win!"
      @still_playing = false
    end
  end
end
