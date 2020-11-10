

require "tty-prompt"

prompt = TTY::Prompt.new

require "tty-prompt"
require "pry"

class CLI

    @@prompt = TTY::Prompt.new

    def greet 
        pastel = Pastel.new
        font = TTY::Font.new(:starwars)
        font2 = TTY::Font.new(:doom)
        puts pastel.yellow(font2.write("                                                                WHO"))        
        sleep(0.5)
        puts ""
        puts pastel.yellow(font2.write("                 WANTS                                              TO"))  
        sleep(0.5)
        puts pastel.yellow(font2.write("BE                                                                                                              A"))                                                                           
        sleep(0.5)
        puts ""
        puts pastel.green(font.write("         THOUSANDAIRE"))
        puts ""
    end

    def run 
        greet
        sleep(1)
        display_menu
    end 

    def display_menu 
            choices = [ 
                { "Play a new game" => 1},
                { "See high scores" => 2},
                { "Quit" => 3}
            ]
            user_input = @@prompt.select("What would you like to do?", choices)
                case user_input 
                when 1 
                    puts "Get your trigger finger ready!"
                when 2 
                    puts "The scores on the doors are..."
                when 3 
                    puts "The pressure got too much for you huh?"
                    exit!
                end
    end
end