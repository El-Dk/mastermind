# frozen_string_literal: false

require './coder'
require './display'
require "./computer"

def generate_code
  code = ''
  4.times { code << (rand(6) + 1).to_s }
  code
end

def break_code(coder)
  loop do
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

def get_guess
  guess = gets.chomp
  if guess.length != 4
    puts 'Please pick a color: '
  end
end

code = generate_code
coder = Coder.new(code)
answer = 'y'

while answer == 'y'
  break_code(coder)
  print "Wanna play again? (y/n): "
  answer = gets.chomp.downcase
  coder.reset(generate_code) if answer == 'y'
end
