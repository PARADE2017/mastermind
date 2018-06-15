class Code
  LETTERS = ['R', 'Y', 'G', 'B']
  attr_accessor :guess, :code, :hint

  def initialize
    @guess = []
    @code = []
    @hint = []
  end

  def make_code
    @code = LETTERS.sample(4)
  end

  def enter_guess
    i = 0
    while i < 4
      print "Letter #{i + 1}: "
      @guess[i] = gets.chomp.upcase
      if valid_guess?(i)
        i += 1
      else
        puts 'try again'
      end
    end
    puts "Guess: #{@guess}"
  end

  def valid_guess?(index)
    LETTERS.include?(@guess[index])
  end

  def hints
    @hint = [0, 0]
    @guess.length.times do |i|
      if @guess[i] == @code[i]
        @hint[0] += 1
      elsif @code.include?(@guess[i])
        @hint[1] += 1
      end
    end
  end

  def results
    puts "\n"
    puts "Exact: #{@hint[0]} \t Close: #{@hint[1]}\t"
    puts "\n"
  end

  def conclusion
    hints
    results
  end

  def play
    make_code
    10.times do
      enter_guess
      conclusion
      if @hint[0] == 4
        puts 'You Win!'
        play_again
        break
      else
        puts 'Try Again'
      end
    end
  end

  def play_again
    puts "Do you wish to play again? ( Enter 'y' for yes or 'n' for no)"
    response = gets.chomp
    if response == 'y'
      play
    else
      puts 'Thanks for playing'
    end
  end
end

game1 = Code.new
game1.play
