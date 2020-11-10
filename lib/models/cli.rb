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
        # sleep(0.5)
        puts ""
        puts pastel.yellow(font2.write("                 WANTS                                              TO"))  
        # sleep(0.5)
        puts pastel.yellow(font2.write("BE                                                                                                              A"))                                                                           
        # sleep(0.5)
        puts ""
        puts pastel.green(font.write("         THOUSANDAIRE"))
        puts ""
    end

    def run 
        greet
        # sleep(1)
        display_menu
    end 

    def display_menu 
            choices = [ 
                { "Log in" => 1},
                { "Create new user" => 2},
                { "Quit" => 3}
            ]
            user_input = @@prompt.select("What would you like to do?", choices)
                case user_input 
                when 1 
                    CLI.log_in
                when 2 
                    CLI.new_user_create 
                when 3 
                    exit! 
                end
    end

    def self.log_in
        prompt = TTY::Prompt.new
        username = prompt.ask("What's your name, friend?")
        password = prompt.mask("Enter your password:")
        if User.find_by(username: username, password: password)
            @user = User.find_by(username: username, password: password)
            @user
            CLI.play_menu
        elsif User.find_by(username: username)
            puts "Incorrect Password, please try again"
            CLI.log_in
            # quit if entered 3 times?
        else 
            puts "hmm...we can't find you. Create a new user? "
            CLI.new_user_create
        end
    end 

    def self.play_menu 
        choices = [ 
                { "Play a new game" => 1},
                { "See high scores" => 2},
                { "See leaderboard" => 3},
                { "Quit" => 4}
            ]
            user_input = @@prompt.select("Welcome! Are you ready to win big?", choices)
                case user_input 
                when 1 
                    puts "Get your trigger finger ready!"
                    CLI.start_game 
                when 2 
                    puts "The scores on the doors are..."
                    CLI.see_scores
                when 3
                    puts "Take me to your leader"
                    CLI.leaderboard
                when 4
                    puts "The pressure got too much for you huh?"
                    exit!
                end
    end

    def self.new_user_create
        prompt = TTY::Prompt.new
        username = prompt.ask("Whats your name, friend?")
        password = prompt.mask("Set your password:")
            if User.find_by(username: username, password: password)
            puts "User already exists, log in here:"
            CLI.log_in
        else 
        @user = User.create(username: username, password: password)
        CLI.play_menu
        end 
    end

#there are 10 rounds 
# 1. 50 - easy
# 2. 50 - easy 
# 3 50  - easy
# 4. 100 - medium 
# 5. 100 -medium 
# 6. 100 -medium 
# 7. 100 -medium 
# 8. 150 -hard 
# 9. 150 -hard
# 10. 150 -hard


    def self.start_game    
        prompt = TTY::Prompt.new
        @score = 0 

        

        CLI.question_easy
        @score += 10  #how do we not hard code this?
        CLI.question_easy
        @score += 10 #how do we not hard code this?
        CLI.question_easy
        @score += 10 #how do we not hard code this?
        # CLI.question_medium
        # CLI.question_medium
        # CLI.question_medium
        # CLI.question_medium
        # CLI.question_hard
        # CLI.question_hard
        # CLI.question_hard
        
        
        puts "Congratulations, you are officially a Thousandaire"
        
        this_game = Game.create(user_id: @user.id, lifeline_1: true, lifeline_2: true, lifeline_3: true, score: @score)
        p @score 
        p this_game
        
        # answers = [ 
        #     { "#{Question.first.incorrect_answer_1}" => 1},
        #     { "#{Question.first.incorrect_answer_2}" => 2},
        #     { "#{Question.first.correct_answer}" => 3},
        #     { "#{Question.first.incorrect_answer_3}" => 4}
        # ]
        # user_answer = @@prompt.select("#{Question.first.question}",
        #  answers)
        # if user_answer == Question.first.correct_answer
        #     continue_game
        # else 
        #     puts "Incorrect! You lose!!!"
        #     # display_score 
    end

#QUESTIONS -how to avoid repeats.
    def self.question_easy 
        question = Question.all.select { |q| q.difficulty == "easy"}.sample

        # i = 1
        # questions[i]
        # i+= 1
        # binding.pry
        # question_one = []
        # question_two = []
        # question_three = []
        # i = 0 
        # while i < questions.length 
        #     item = questions[i]
        #     item << question_one 
        #         if question_one == item 
        #             item << question_two 
        #             if question_two == item 
        #                 item << question_3
        #     i += 1
        #             end
        #         end
        #     end
     
        answers = [ 
                "#{question.incorrect_answer_1}",
                "#{question.incorrect_answer_2}",
                "#{question.correct_answer}",
                "#{question.incorrect_answer_3}"
    ].shuffle
            user_answer = @@prompt.select("#{question.question}",
             answers)
            
            if user_answer == question.correct_answer
                # sleep(1.5)
                puts "Congratulations, #{@user.username}, that is the correct answer"
                #add question value to user high score 
                puts "You banked #{question.value_of_question}"

                # this_game.score += question.value_of_question
                # i += me.sc1 

                # continue_game
            else 
                puts "Incorrect! You lose!!!"
                # display_score 
                exit!
            end
    end

    def self.see_scores
        players_games = Game.all.find_all { |g| g.user_id == @user.id}
        p1 = players_games.map { |pg| pg.score}
        p2 = p1.max(5)
        puts "Your top scores are:" 
        p ""   
        p2.each.with_index(1) do |s, i| puts "#{i}. #{s}" end 
    end 

    def self.leaderboard 
       all_scores = Game.all.map { |g| g.score}
       all_scores.max(10).each.with_index(1) do | s, i| puts "#{i}. #{s}" end 
    end

    def self.question_medium 
        question = Question.all.select { |q| q.difficulty == "medium"}.sample
     
        answers = [ 
                "#{question.incorrect_answer_1}",
                "#{question.incorrect_answer_2}",
                "#{question.correct_answer}",
                "#{question.incorrect_answer_3}"
    ].shuffle
            user_answer = @@prompt.select("#{question.question}",
             answers)
            #  binding.pry
            if user_answer == question.correct_answer
                # sleep(1.5)
                puts "Congratulations, that is the correct answer"
                puts "You banked #{question.value_of_question}"
                #add question value to user high score 
                # total = @this_game.score += question.value_of_question

                # continue_game
            else 
                puts "Incorrect! You lose!!!"
                # display_score 
                exit!
            end
        end
    
    def self.question_hard
        question = Question.all.select { |q| q.difficulty == "hard"}.sample
     
        answers = [ 
                "#{question.incorrect_answer_1}",
                "#{question.incorrect_answer_2}",
                "#{question.correct_answer}",
                "#{question.incorrect_answer_3}"
    ].shuffle
            user_answer = @@prompt.select("#{question.question}",
             answers)
            #  binding.pry
            if user_answer == question.correct_answer
                # sleep(1.5)
                puts "Congratulations, that is the correct answer"
                #add question value to user high score 
                # User.score += question.value_of_question

                # continue_game
            else 
                puts "Incorrect! You lose!!!"
                # display_score 
                exit!
            end
        end

end
