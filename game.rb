# frozen_string_literal: true
require_relative 'word'
require_relative 'player'

class Game
  @@total_wins = 0
  @@total_losses = 0
  @@total_rounds = 0

  def initialize

    @player_instance = Player.new
    @game_state = true
    rounds #calls the main method in which the logic is handled
  end
  
  def rounds
    puts "Welcome To Guess The Word Thing!"

    while @@total_wins < 3 && @@total_losses < 3
      puts "-"
      puts "-"
      puts "-"
      current_game
      puts "Your Score = #{@@total_wins} wins and #{@@total_losses} rounds lost. Best out of 5!"
      next
    end
    
    if @@total_wins == 3
      puts "You win the best out of 5!!"
    else
      puts "You lose the best out of 5!!"
    end
  end


  def current_game
    @remaining_attempts = 6
    @correct_guesses = []
    @incorrect_guesses = []
    @word_instance = Word.new
    @current_word = @word_instance.current_word
    @masked_word = "_" * @current_word.length

    while @remaining_attempts > 0 && @masked_word != @current_word
      puts "The Word is: #{@masked_word}"
      guess = @player_instance.get_guess

      if @correct_guesses.include?(guess) || @incorrect_guesses.include?(guess)
        @remaining_attempts -= 1
        puts "You have already guessed that letter. You have #{@remaining_attempts} lives left! \n"
        next
      elsif @current_word.include?(guess)
        @current_word.chars.each_with_index do |char, index|
          if char == guess
            @masked_word[index] = guess
          end
        end
        puts "A correct guess! \n"
        @correct_guesses = @correct_guesses << guess
        next

      else
        @remaining_attempts -= 1
        puts "Incorrect. You have #{@remaining_attempts} lives left! \n"
        @incorrect_guesses = @incorrect_guesses << guess
        next
      end
    end

    if @remaining_attempts == 0
      puts "Round over! You didn't guess the word, it was #{@current_word}. \n"
      @@total_losses += 1
    elsif @masked_word == @current_word
      puts "Good job you guessed the word correctly and had #{@remaining_attempts} lives left. \n"
      @@total_wins += 1
    end
  end

end

if __FILE__ == $0
  Game.new
end