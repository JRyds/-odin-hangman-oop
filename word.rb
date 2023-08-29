# frozen_string_literal: true

class Word
  attr_reader :current_word

  def initialize
    new_word
  end

  def new_word
    @dictionary = File.readlines("words.txt").map(&:chomp)

    while true
      current_word = @dictionary.sample
      if current_word.length.between?(5, 10)
        @current_word = current_word
        break
      end
    end
    @current_word
  end

end
