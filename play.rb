# A game built in Ruby, played on terminal.

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# RULES
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# Pick Letters and try to complete a word guess
# Too many mistakes, game is over, because you have ran out of lives

class Hangman

  def initialize
    @letters = ('a'..'z').to_a
    @word = word.sample
    @lives = 7
    @correct_guesses = []
    @word_teaser = " "
    @word.first.size.times do |n|
    
      @word_teaser += "_ "

    end
  end

  def word

    [
      ["criket", "A game played by a gentle man"],
      ["jogging", "We are not walking"],
      ["celebrate", "Remembring special moments"],
      ["continent", "We have seven of them"],
      ["exotic", "Am Not from around here"],

    ]

  end

  def print_teaser last_guess = nil

    update_teaser(last_guess) unless last_guess.nil?
    
    puts @word_teaser
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split
    # Replace blank value with guessed letter if matches in letter in word
    new_teaser.each_with_index do |letter, index|
        if letter == "_" && @word.first[index] == last_guess
          new_teaser[index] = last_guess
        end
    end
    @word_teaser = new_teaser.join(" ")
  end

  def make_guess
    if @lives > 0
      puts "Enter a letter"
      guess = gets.chomp
      puts "You guessed #{guess}"
      #  If letter is not part of the word then remove letter from array
      good_guess = @word.first.include? guess

      if good_guess 
        puts "Good guess, You are correct!!! Bravo!!!!!!"
        @correct_guesses << guess
        print_teaser
        make_guess

        # Remove correct alphabet from remaining letters

        @letters.delete guess

      else
        @lives -= 1
        puts "Sorry..... You have #{@lives} guesses left, please try again!!!!"
        make_guess
      end

    else
      puts "Game Over!!! Better lock next time dude!!!"
    end
    
  end

  def begin
    
    puts "New game started... your word is #{@word.first.size} characters long"
    print_teaser
    puts "Clue: #{@word.last}"
    make_guess
  end


end

game = Hangman.new
game.begin