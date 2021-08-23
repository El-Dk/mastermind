# frozen_string_literal: false

require './coder'
require './display'
require "./computer"

def generate_code
  code = ''
  4.times { code << (rand(6) + 1).to_s }
  code
end

def break_code_user(coder)
  loop do
    print 'Take a guess: '
    guess = gets.chomp.downcase
    hints = coder.check_code(guess)
    if coder.win?
      puts 'You Won'
      break
    elsif coder.guesses >= 12
      puts 'You Lost'
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
    puts "Computer's guess: #{guess}"
    hints = coder.check_code(guess)
    if coder.win?
      puts 'Computer Won'
      break
    elsif coder.guesses >= 12
      puts 'Computer Lost'
      break
    else
      coder.show_hints
      computer.remove_options(hints)
    end
  end  
end

def get_guess
  guess = gets.chomp
  if guess.length != 4
    puts 'Please pick a color: '
  end
end


answer = 'y'
while answer == 'y'
  print "Pick the role you want to play:\n" + 
       "1.- Code Breaker\n" +
       "2.- Code Maker\n" + 
       'Option: ' 
  type_of_game = gets.chomp
  if type_of_game == '1'
    code = generate_code
    coder = Coder.new(code)
    break_code_user(coder)
  else
    print 'Write the code to break: '
    code = gets.chomp
    coder = Coder.new(code)
    break_code_computer(coder)
  end
  print "Do you want to play again? (y/n): "
  answer = gets.chomp.downcase
  coder.reset(generate_code) if answer == 'y'
end
