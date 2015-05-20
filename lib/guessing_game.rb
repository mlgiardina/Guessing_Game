class GuessingGame
  attr_accessor :computer_number, :user_guess, :guess_counter, :still_playing, :guess_tracker

  def initialize
    @still_playing = true
    @guess_counter = 0
    @guess_tracker = []
    @too_high = []
    @too_low = []
  end

  def new_computer_number
    @computer_number = rand(100)
  end

  def playing
    while @still_playing == true
      get_user_guess
      check_useless_guess
      compare_numbers
      system("clear")
      check_guess_counter
      display_guesses
    end
  end

  def start
    new_computer_number
    playing
    replay
  end

  def check_guess_counter
    if @guess_counter > 4
      @still_playing = false
      puts "You lose. The computer's number was #{@computer_number}"
    end
  end

  def get_user_guess
    puts "Guess a number between 0 and 100."
    @user_guess = gets.chomp.to_i
    if @guess_tracker.any? { |past_guess| past_guess == @user_guess }
      puts "You already guessed that. Are you unwell?"
      @guess_counter += 1
    else
      @guess_tracker.push(@user_guess)
      @guess_counter += 1
    end
  end

  def compare_numbers
    if @user_guess > @computer_number
      puts "Your guess was too high. Guess again."
      @response = "high"
      @too_high.push(@user_guess)
      sleep 1.5
    elsif @user_guess < @computer_number
      puts "Your guess was too low. Guess again."
      @response = "low"
      @too_low.push(@user_guess)
      sleep 1.5
    elsif @user_guess == @computer_number
      puts "That's correct. You win!"
      @still_playing = false
      sleep 1.5
    end
  end

  def check_useless_guess
    if @response == "high" && @too_high.any? {|past_guesses| @user_guess > past_guesses}
      puts "That was useless. You already know the number is lower than that."
      sleep 1
    elsif @response == "low" && @too_low.any? {|past_guesses| @user_guess < past_guesses}
      puts "That was useless. You already know the number is higher than that."
      sleep 1
    end
  end

  def display_guesses
    puts "Your previous guesses are:\nToo High: #{@too_high}\nToo Low: #{@too_low}."
  end


  def replay
    puts "Would you like to play again? (y or n)"
    play_again = gets.chomp.downcase
    if play_again == "y"
      @still_playing = true
      @guess_counter = 0
      @guess_tracker = []
      start
    elsif play_again == "n"
      puts "Thank you for playing!"
      exit
    else
      puts "That's not a valid response."
    end
  end
end

# new_game = GuessingGame.new
# new_game.start
