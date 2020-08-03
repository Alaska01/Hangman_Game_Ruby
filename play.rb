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

  def begin
    
  puts "New game started... your word is #{@word.first.size} characters long"
  puts "Clue: #{@word.last}"
  puts "Enter a letter"
  guess = gets.chomp
  puts "You guessed #{guess}"
    
  end


end

game = Hangman.new
game.begin