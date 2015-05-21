class GuessingGame
  attr_accessor :computer_number, :user_guess, :guess_counter, :still_playing, :guess_tracker, :user_score

  def initialize
    @still_playing = true
    @guess_counter = 0
    @guess_tracker = []
    @too_high = []
    @too_low = []
    @user_score = 0
    @game_count = 1
  end

  def new_computer_number
    @computer_number = rand(100)
  end

  def playing
    while @still_playing == true
      get_user_guess
      check_useless_guess
      system("clear")
      check_guess_counter
      compare_numbers
      display_guesses
    end
  end

  def start
    system("clear")
    puts """
    Welcome to The Number Guessing Game. Here are the rules:

    1.) The computer picks a random number between 0 and 100
    2.) You get 5 guesses. After that, you lose!

    And that's it!

    What's your name, friend?
"""
    @user_name = gets.chomp
    new_computer_number
    playing
  end

  def check_guess_counter
    if @guess_counter > 4
      @still_playing = false
      puts "You lose. The computer's number was #{@computer_number}"
      display_guesses
      replay
    end
  end

  def get_user_guess
    puts "Guess a number between 0 and 100, #{@user_name}."
    @user_guess = gets.chomp.to_i

    if @user_guess > 100
      puts "Come on, #{@user_name}, I said pick a number between 0 and 100."
      sleep 1.5
    end

    if @guess_tracker.any? { |past_guess| past_guess == @user_guess }
      puts "Come on, #{@user_name}, you already guessed that. Try something new."
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
      puts "That's correct. You win, #{@user_name}! Great job!"
      @still_playing = false
      @user_score += 1
      sleep 1.5
      display_guesses
      replay
    end
  end

  def check_useless_guess
    if @response == "high" && @too_high.any? {|past_guesses| @user_guess > past_guesses}
      puts "Seriously, #{@user_name}? You already know the number is lower than that. Use your head."
    elsif @response == "low" && @too_low.any? {|past_guesses| @user_guess < past_guesses}
      puts "Seriously, #{@user_name}? You already know the number is higher than that. Use your head."
    end
  end

  def display_guesses
    puts "Your previous guesses are:\nToo High: #{@too_high.sort}\nToo Low: #{@too_low.sort}."
  end


  def replay
    puts "That concludes the game, #{@user_name}. Your current score is #{@user_score}/#{@game_count}. How about another round? (y or n)"
    play_again = gets.chomp.downcase
    if play_again == "y"
      @still_playing = true
      @guess_counter = 0
      @guess_tracker = []
      @game_count += 1
      start
    elsif play_again == "n"
      puts "Thank you for playing!"
      exit
    else
      puts "That's not a valid response."
    end
  end
end

new_game = GuessingGame.new
new_game.start
