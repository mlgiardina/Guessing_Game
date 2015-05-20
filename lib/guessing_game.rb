class GuessingGame

  def initialize
    @still_playing = true
    @guess_counter = 1
    @guess_tracker = []
  end

  def new_computer_number
    @computer_number = rand(100)
  end

  def start
    new_computer_number
    while @still_playing == true
      get_user_guess
      if @skip_compare
        @skip_compare = false
        get_user_guess
      else
        compare_numbers
      end
      check_guess_counter
    end
  end

  def check_guess_counter
    if @guess_counter > 5
        puts "You lose."
        @still_playing = false
    end
  end

  def get_user_guess
    puts "Guess a number between 0 and 100."
    @user_guess = gets.chomp.to_i
    if @guess_tracker.any? { |past_guess| past_guess == @user_guess }
      puts "You already guessed that. Are you unwell?"
      @guess_counter += 1
      @skip_compare = true
    else
      @guess_tracker.push(@user_guess)
      @guess_counter += 1
    end
  end

  def compare_numbers
    if @user_guess > @computer_number
      puts "Your guess was too high. Guess again."
    elsif @user_guess < @computer_number
      puts "Your guess was too low. Guess again."
    elsif @user_guess == @computer_number
      puts "That's correct. You win!"
      @still_playing = false
    end
  end
end
