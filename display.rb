module Display
  def show_hints
    @hints.each do |hint|
      case hint
      when 'right'
        print "\e[30m\u25CF\e[0m "
      when 'almost'
        print "\e[37m\u25CF\e[0m "
      end
    end
    puts ''
  end
end

=begin
puts "\e[91m\u25CF\e[0m "+
"\e[91m\u25CB\e[0m "+
"\e[101m 1 \e[0m"
=end
