require "tty-prompt"
require 'ruby2d'

prompt = TTY::Prompt.new

require "tty-prompt"
require "pry"

class CLI


    @@current_game = nil 
    @@prompt = TTY::Prompt.new

    def greet 
        @theme_tune = Sound.new('./lib/models/game_sounds/millionaire_intro.mp3')
        @theme_tune.play
        pastel = Pastel.new
        font = TTY::Font.new(:starwars)
        font2 = TTY::Font.new(:doom)
        sleep(1.5)
        puts pastel.yellow(font2.write("                                                                WHO"))        
        sleep(1.5)
        puts ""
        puts pastel.yellow(font2.write("                 WANTS                                              TO"))  
        sleep(1.5)
        puts pastel.yellow(font2.write("BE                                                                                                                    A"))                                                                           
        sleep(1.5)
        puts ""
        puts pastel.green(font.write("    THOUSANDAIRE"))
        puts ""
        puts "\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\u{1F4B8}\n\n "
        sleep(1.5)
    end

    def run 
        system('clear')
        greet
        sleep(1)
        display_menu
    end 

    def display_menu 
        choices = [ 
            { "Log in" => 1},
            { "Create new contestant" => 2},
            { "See Leaderboard" => 3},
            { "Quit" => 4}
            ]
            user_input = @@prompt.select("What would you like to do?", choices)
                case user_input 
                when 1 
                    CLI.log_in
                when 2 
                    CLI.new_user_create 
                when 3
                    CLI.leaderboard
                when 4
                    exit! 
        end
    end

    def self.log_in
        prompt = TTY::Prompt.new
        username = prompt.ask("Welcome back! Remind us of your name?\n")
        password = prompt.mask("Enter your password:")
        if  User.find_by(username: username, password: password)
            @user = User.find_by(username: username, password: password)
            @user
            CLI.play_menu
        elsif 
            User.find_by(username: username)
            puts "Incorrect Password, please try again:"
            CLI.log_in
        else 
            system('clear')
            puts "hmm...we can't find you. Create a new contestant? "
            CLI.new_user_create
        end
    end 

    def self.play_menu 
        system('clear')
        choices = [ 
            { "Play a new game" => 1},
            { "See high scores" => 2},
            { "See leaderboard" => 3},
            { "Delete your account" => 4},
            { "Quit" => 5}
            ]
            user_input = @@prompt.select("Welcome #{@user.username}! Are you ready to win big?\n\n", choices)
            case user_input 
            when 1 
                puts "Get your trigger finger ready!"
                sleep(1)
                CLI.start_game 
            when 2 
                CLI.see_scores
            when 3
                CLI.leaderboard
            when 4
                users_games = Game.all.find_all { |game| game.user_id == @user.id}
                Game.delete(users_games) # deletes all games belonging to user 
                User.delete(@user)
                puts "You have deleted your account."
                system('clear')
                CLI.log_in
            when 5
                system('clear')
                puts "The pressure got too much for you huh?"
                sleep(1)
                exit!
        end
    end

    def self.new_user_create
        prompt = TTY::Prompt.new
        username = prompt.ask("Whats your name, friend?")
        password = prompt.mask("Set your password:")
            if User.find_by(username: username, password: password)
            puts "That contestant already exists, log in here:"
            CLI.log_in
        else 
        @user = User.create(username: username, password: password)
        CLI.play_menu
        end 
    end

    def self.start_game    
        prompt = TTY::Prompt.new
        @score = 0 
        @this_game = Game.create(user_id: @user.id, lifeline_1: true, lifeline_2: true, lifeline_3: true, score: @score)
        @question_number = 1 

        CLI.question_easy
        CLI.question_correct

        CLI.question_easy
        CLI.question_correct

        CLI.question_easy
        CLI.question_correct

        CLI.question_medium
        CLI.question_correct

        CLI.question_medium
        CLI.question_correct

        CLI.question_medium
        CLI.question_correct

        CLI.question_medium
        CLI.question_correct

        CLI.question_hard
        CLI.question_correct

        CLI.question_hard
        CLI.question_correct

        CLI.question_hard
        CLI.question_correct

        @theme_tune = Sound.new('./lib/models/game_sounds/millionaire_intro.mp3')
        @theme_tune.play

        puts "Congratulations! \n\n".colorize(:green)
        sleep(1)
        puts "you are \n\n".colorize(:green)
        sleep(1)
        puts "officially a \n\n".colorize(:green)
        sleep(1)
        pastel = Pastel.new
        font = TTY::Font.new(:starwars)
        puts pastel.green(font.write("THOUSANDAIRE"))
        200.times { print "\u{1F4b0}" }
        sleep(5)

        CLI.play_menu
    end

    def self.question_correct 
        @correct_sound = Sound.new('./lib/models/game_sounds/millionaire_quest_win.mp3')
        @correct_sound.play
        @question_number += 1
        @score += @new_value
        CLI.update_score 
    end

    def self.update_score 
        @this_game.update_column(:score, @score) 
    end

    def self.question_easy 
        @quest_start_sound = Sound.new('./lib/models/game_sounds/millionaire_quest_start.mp3')
        @quest_start_sound.play
            @question = Question.all.select { |q| q.difficulty == "easy"}.sample
            @this_gq = GameQuestion.create(game_id: @this_game.id, question_id: @question.id, correct_answer: @question.correct_answer)
            CLI.question_method 
    end 
    
        def self.question_method 
            answers = [ 
                  {"#{@question.correct_answer}" => 1},
                  {"#{@question.incorrect_answer_1}" => 2},
                  {"#{@question.incorrect_answer_2}" => 3},
                  {"#{@question.incorrect_answer_3}" => 4}
                      ].shuffle
            lifelines = [
                    {"50/50".colorize(:yellow) => 5},
                    {"Phone a Friend".colorize(:yellow) => 6}, 
                    {"Ask the Audience".colorize(:yellow) => 7},
                    ]
            answers_5050 = [
                    {"#{@question.correct_answer}" => 1},
                    {"#{@question.incorrect_answer_1}" => 2}
                ].shuffle
                    loop do
                        system('clear')
                        puts "Question #{@question_number}: \n\n"
                        @new_value = @question.value_of_question + (@question_number * 10)
                        puts "For $#{@new_value}\n\n"
                        user_answer = @@prompt.select("#{@question.question}",
                        answers, "\n Use a lifeline:",  lifelines, timer: 3)
                            case user_answer 
                            when 1
                                sleep(1)
                                CLI.final_answer
                                CLI.correct_answer
                            break
                            when 2 
                                sleep(1)
                                CLI.final_answer
                            CLI.incorrect_answer
                            exit
                           when 3 
                            sleep(1)
                            CLI.final_answer
                                  CLI.incorrect_answer
                                  exit
                           when 4 
                            sleep(1)
                            CLI.final_answer
                                CLI.incorrect_answer
                                  exit
                           when 5    
                                if @this_game.lifeline_1 == true 
                                puts user_answer = @@prompt.select("#{@question.question}",
                                answers_5050)
                                    if user_answer == 1
                                        @this_game.lifeline_1 = false 
                                        CLI.correct_answer
                                        break 
                                    else 
                                    system('clear')
                                    @quest_lose_sound = Sound.new('./lib/models/game_sounds/millionaire_quest_lose.mp3')
                                    @quest_lose_sound.play
                                    puts "You had a 50/50 chance and you blew it!".colorize(:red)
                                    puts "You earned $#{@this_game.score} this game!."
                                    puts "To collect your winnings please contact Flatiron School. \u{1F4b0}"
                                    user_answer = @@prompt.keypress(" \n\nWould you like to play again?, \n Press any key to continue", timer: 5)
                                    CLI.play_menu
                                end 
                                else 
                                    system('clear')
                                    puts "\n\n You have already used 50/50!\n\n "
                                    sleep (1)
                            end
                           when 6 
                            if @this_game.lifeline_2 == true 
                            200.times { print "\u{260E}" }
                            puts "\n\n You have 15 seconds to phone a friend, make it count" 
                                CLI.phone_a_friend 
                                @this_game.lifeline_2 = false 
                            elsif @this_game.lifeline_2 == false  
                                system('clear') 
                                puts "\n\n You have already phoned your friend! \n\n"
                                sleep(1)
                            end
                           when 7 
                            if @this_game.lifeline_3 == true
                                200.times { print "\u{1F64B}" } 
                                puts "\n\n You have 15 seconds to ask the audience, let's hope they know!" 
                                sleep(1)
                                CLI.ask_the_audience
                                @this_game.lifeline_3 = false
                            else 
                                system('clear')
                                puts "\n\n You have already asked the audience!\n\n"
                                sleep(1)
                            end
                        end
                    end
                end

                def self.correct_answer
                    @quest_correct_sound = Sound.new('./lib/models/game_sounds/millionaire_quest_win.mp3')
                @quest_correct_sound.play
                    puts "Congratulations, #{@user.username}, that is the correct answer \n"
                                puts "You banked $#{@new_value}".colorize(:green)
                                current_total = @score + @new_value
                                puts "Your current total is $#{current_total}.".colorize(:green)
                                sleep(5)
                end

            def self.final_answer
                user_input = @@prompt.select("...Is that your final answer?", "Yes", "No")
                if 
                    user_input == "Yes" 
                elsif 
                    user_input == "No" 
                    CLI.question_method #its shuffling the questions if say 'no'
                end
            end

            def self.incorrect_answer 
                system('clear')
                @quest_lose_sound = Sound.new('./lib/models/game_sounds/millionaire_quest_lose.mp3')
                @quest_lose_sound.play
                puts "Incorrect! You lose!!!".colorize(:red)
                puts "You earned $#{@this_game.score} this game!.".colorize(:green)
                puts "To collect your winnings please contact Flatiron School.  \u{1F4b0}"
                user_answer = @@prompt.keypress(" \n\nWould you like to play again?, \n Press any key to continue", timer: 5)
                CLI.play_menu 
            end

            def self.question_medium
                @question = Question.all.select { |q| q.difficulty == "medium"}.sample
                @this_gq = GameQuestion.create(game_id: @this_game.id, question_id: @question.id, correct_answer: @question.correct_answer)
            CLI.question_method 
            end      

            def self.question_hard
                @question = Question.all.select { |q| q.difficulty == "hard"}.sample
                @this_gq = GameQuestion.create(game_id: @this_game.id, question_id: @question.id, correct_answer: @question.correct_answer)
                CLI.question_method 
            end       


            def self.countdown_timer 
                3.downto(0) do |i|
                    puts "00:00:#{'%02d' % i}"
                    sleep(1)
                end
                system('clear')
                puts "\n\n\nYour time is up! Please answer the question!".colorize(:red)
                sleep 1.5
            end

            def self.phone_a_friend 
                CLI.countdown_timer 
            end

            def self.ask_the_audience
                CLI.countdown_timer
            end
            
            def self.leaderboard 
                system('clear')
                font = TTY::Font.new(:doom)
                puts font.write("Take Me To Your Leader...")
                puts "Check em' out --"
                all_scores = Game.all.max_by(10) { |g| g.score} 
                user_ids = all_scores.map { |game| game.user_id }
                players = user_ids.map {|id| User.find(id).username}
                scores = all_scores.map { |g| g.score }
                i = 0
                while i < 10
                 puts "#{i + 1}. #{players[i]}: $#{scores[i]}"
                 i +=1
                end 
                @@prompt.keypress("Press any key to return to menu:")
                CLI.play_menu
             end
        
             def self.see_scores
                font = TTY::Font.new(:standard)
                puts font.write("The scores on the doors are...")
                players_games = Game.all.find_all { |g| g.user_id == @user.id}
                p1 = players_games.map { |pg| pg.score}
                p2 = p1.max(5)
                puts "Your top scores are:\n"  
                p2.each.with_index(1) do |s, i| puts "#{i}. $#{s}" end
                @@prompt.keypress("Press any key to return to menu:")
                CLI.play_menu
            end 
end
