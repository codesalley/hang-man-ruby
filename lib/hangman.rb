class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = self.class.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(arg)
    if @attempted_chars.include?(arg)
      true
    else
      false
    end

  end

  def get_matching_indices(arg)
    res = []
    @secret_word.each_char.with_index do |value, index|
      if value == arg
        res << index
      end
    end
    res
  end

  def fill_indices(chr, arr)
    arr.each do |ele|
      @guess_word[ele] = chr
    end
  end

  def try_guess(chr)
    indices = get_matching_indices(chr)
    self.fill_indices(chr, indices)
    if self.already_attempted?(chr) == true
      p 'that has already been attempted'
      return false
    end
    @attempted_chars << chr

    @remaining_incorrect_guesses -= 1 if indices.empty?
    true
  end

  def ask_user_for_guess
    p 'Enter a char:'
    guess = gets.chomp
    pip = self.try_guess(guess)

  end

  def win?
    if @guess_word.join('') == @secret_word
      p 'WIN'
      return true
    else
      false
    end
  end

  def lose?

    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? or self.lose?

      p @secret_word
      true
    else
      false
    end
  end
end
