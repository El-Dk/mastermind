# frozen_string_literal: false

require './coder'
require './display'
require './computer'

def generate_code
  code = ''
  4.times { code << rand(1..6).to_s }
  code
end

def break_code_user(coder)
  loop do
    print "\nColors:\t"
    coder.show_colors
    print 'Take a guess: '
    guess = validate_guess
    puts "\n"
    puts "\tGuess ##{coder.guesses + 1}:\t\t\tHints:\n\n"
    print "\t"
    coder.show_guess(guess)
    coder.check_code(guess)
    if coder.win?
      puts "\n\n\t\t\t-------"
      puts "\t\t\tYOU WON"
      puts "\t\t\t-------\n\n"
      break
    elsif coder.guesses >= 12
      print "\n\n\t\tYou Lost, the code was: " # {coder.code}\n\n"
      coder.show_guess(coder.code)
      puts "\n\n"
      break
    else
      coder.show_hints
    end
  end
end

def break_code_computer(coder)
  computer = Computer.new
  loop do
    guess = computer.guess
    puts "\n"
    puts "\tGuess ##{coder.guesses + 1}:\t\t\tHints:\n\n"
    print "\t"
    coder.show_guess(guess)
    hints = coder.check_code(guess)
    if coder.win?
      puts "\n\n\t\t\t------------"
      puts "\t\t\tComputer Won"
      puts "\t\t\t------------\n\n"
      break
    elsif coder.guesses >= 12
      puts "Computer Lost, the code was #{coder.code}"
      break
    else
      coder.show_hints
      computer.remove_options(hints)
    end
  end
end

def validate_guess
  guess = gets.chomp.strip
  until guess.length == 4 && guess.to_i.to_s == guess && !check_digits(guess)
    puts 'Invalid input. Only use numbers from 1 to 6.'
    print 'Please pick four colors: '
    guess = gets.chomp.strip
  end
  guess
end

def check_digits(guess)
  guess.include?('7') || guess.include?('8') || guess.include?('9') || guess.include?('0')
end

coder = Coder.new('1111')
answer = 'y'
coder.show_instructions
while answer == 'y'
  print "\nPick the role you want to play:\n\n" \
        "1.- Code Breaker\n" \
        "2.- Code Maker\n\n" \
        'Role: '
  type_of_game = gets.chomp.strip
  until %w[1 2].include?(type_of_game)
    print 'Please choose 1 or 2: '
    type_of_game = gets.chomp.strip
  end
  if type_of_game == '1'
    code = generate_code
    coder.reset(code)
    break_code_user(coder)
  else
    print "\nWrite the code to break: "
    code = validate_guess
    coder.reset(code)
    break_code_computer(coder)
  end
  print 'Do you want to play again? (y/n): '
  answer = gets.chomp.downcase.strip
  until %w[y n].include?(answer)
    print "Please choose 'y' or 'n': "
    answer = gets.chomp.downcase.strip
  end
  coder.reset(generate_code) if answer == 'y'
end
