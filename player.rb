# frozen_string_literal: true
# get_guess: This method will be responsible for getting user input (a guessed letter).
#
# valid_guess?: This method will be responsible for checking if the input received is a valid guess
# (for example, it could check if the input is a single letter that hasn't been guessed before).
#
# store_guess: This method will be responsible for storing the guess into @past_guesses if it's valid.

class Player

  def initialize

  end

  def get_guess
    puts "Guess by inputting a single letter: "
    guess = nil
    while true
      guess = gets.chomp
      if valid_guess?(guess)
        break
      else
        puts "Invalid input. Please enter a single letter: "
        next
      end
    end
    guess
  end

  def valid_guess?(guess)
    guess.length == 1 && guess.match?(/^[a-zA-Z]$/)
  end

end
