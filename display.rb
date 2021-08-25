module Display
  def show_colors
    ('1'..'6').each do |i|
      print "#{@colors[i]} "
    end
    puts "\n\n"
  end

  def show_guess(guess)
    puts "\n"
    puts "\tGuess ##{@guesses + 1}:\t\t\tHints:\n\n"
    print "\t"
    colors = guess.split('')
    colors.each { |color| print "#{@colors[color]} " }
    print "\t\t"
  end

  def show_hints
    @hints.each do |hint|
      case hint
      when 'right'
        print "\e[30m\u25CF\e[0m "
      when 'almost'
        print "\e[37m\u25CF\e[0m "
      end
    end
    puts "\n\n"
  end
  def show_instructions
    puts "\t\t\tMastermind - Instructions\n" + 
      "There two ways to play Mastermind, you can be the code breaker or the code maker.\n" +
      "As a code breaker you will have to break the code the computer generates. The code\n" +
      "will consist of four colors picked from a pool of six (colors can be repeated)\n"
      print "\nPool of colors: "
      show_colors
      puts "In order to break the code you will have to make a guess by choosing four colors\n" +
      "(colors can be repeated), each color is represented with a number from 1 to 6.\n" +
      "\nExample of a guess: 1234\n\n" +
      "You have up to 12 tries to break the code.\n" + 
      "\nOnce you make a guess you will receive colored pins as hints:\n" +
      "\t\e[30m\u25CF\e[0m means that one color is correct and is in position.\n" +
      "\t\e[37m\u25CF\e[0m means that one color is correct but it is not in its position.\n" +
      "\nDon't forget that you have up to 12 guesses to break the code, be sure to use the\n" +
      "hint wisely.\n" +
      "\nAs a code maker you will have to make the code (same rules, four colors from the pool)\n" +
      "the computer will have to break your code, if it doesn't you'll win so good luck!"
  end
  
end

=begin
puts "\e[91m\u25CF\e[0m "+
"\e[91m\u25CB\e[0m "+
"\e[101m 1 \e[0m"
=end
