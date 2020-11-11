require 'rest-client'
require 'pry'
require 'JSON'




User.destroy_all
Game.destroy_all
Question.destroy_all
GameQuestion.destroy_all 

api_resp = RestClient.get("https://opentdb.com/api.php?amount=50&type=multiple") 
api_data = JSON.parse(api_resp)

easy_questions = api_data["results"].select { |q| q["difficulty"] == "easy" }
medium_questions = api_data["results"].select { |q| q["difficulty"] == "medium"}
hard_questions =  api_data["results"].select { |q| q["difficulty"] == "hard" }

#these work, but need to figure out how to break down incorrect_answer hash with array as value
# easy_questions.each { |q| Question.create(value_of_question: 50, difficulty: "easy", question: q["question"], correct_answer: q["correct_answer"], incorrect_answer_1: "Bull", incorrect_answer_2: "Cat", incorrect_answer_3: "Dog")}
# medium_questions.each { |q| Question.create(value_of_question: 50, difficulty: "medium", question: q["question"], correct_answer: q["correct_answer"], incorrect_answer_1: "Bull", incorrect_answer_2: "Cat", incorrect_answer_3: "Dog")}
# hard_questions.each { |q| Question.create(value_of_question: 50, difficulty: "hard", question: q["question"], correct_answer: q["correct_answer"], incorrect_answer_1: "Bull", incorrect_answer_2: "Cat", incorrect_answer_3: "Dog")}

#possible answers: 
# easy_questions.each { |q| Question.create(value_of_question: 50, difficulty: "easy", question: q["question"], correct_answer: q["correct_answer"], incorrect_answer_1: q["incorrect_answers"], incorrect_answer_2: q["incorrect_answers"], incorrect_answer_3: q["incorrect_answers"])}
# medium_questions.each { |q| Question.create(value_of_question: 50, difficulty: "easy", question: q["question"], correct_answer: q["correct_answer"], incorrect_answer_1: q["incorrect_answers"], incorrect_answer_2: q["incorrect_answers"], incorrect_answer_3: q["incorrect_answers"])}
# hard_questions.each { |q| Question.create(value_of_question: 50, difficulty: "easy", question: q["question"], correct_answer: q["correct_answer"], incorrect_answer_1: q["incorrect_answers"], incorrect_answer_2: q["incorrect_answers"], incorrect_answer_3: q["incorrect_answers"])}

# [{"category"=>"History",
#   "type"=>"multiple",
#   "difficulty"=>"easy",
#   "question"=>"Which German field marshal was known as the `Desert Fox`?",
#   "correct_answer"=>"Erwin Rommel",
#   "incorrect_answers"=>["Ernst Busch", "Wolfram Freiherr von Richthofen", "Wilhelm List"]},

binding.pry

# # users
# chelsey = User.create(username: 'Chelsey', password: '1234')
# jimmy = User.create(username: "Jimmy", password: "5678")
# jackie = User.create(username: "Jackie", password: "9090")
# erica = User.create(username: "Erica", password: "4332")
# u6 = User.create(username: "A", password: "1234")
# u7 = User.create(username: "B", password: "1235")
# u8 = User.create(username: "C", password: "1236")
# u9 = User.create(username: "D", password: "1237")
# u10 = User.create(username: "E", password: "1238")

# #games
# game1 = Game.create(user_id: chelsey.id, lifeline_1: true, lifeline_2: true, lifeline_3: true, score: 0 )
# game2 = Game.create(user_id: jimmy.id, lifeline_1: true, lifeline_2: true, lifeline_3: true, score: 0  )
# game3 = Game.create(user_id: jackie.id, lifeline_1: true, lifeline_2: true, lifeline_3: true, score: 0  )
# game4 = Game.create(user_id: jimmy.id, lifeline_1: true, lifeline_2: true, lifeline_3: true, score: 0  )
# game5 = Game.create(user_id: erica.id, lifeline_1: true, lifeline_2: true, lifeline_3: true, score: 0 )
# g6 = Game.create(user_id: u6.id, lifeline_1: true, lifeline_2: true, lifeline_3: true, score: 0 )
# g7 = Game.create(user_id: u7.id, lifeline_1: true, lifeline_2: true, lifeline_3: true, score: 0 )
# g8 = Game.create(user_id: u8.id, lifeline_1: true, lifeline_2: true, lifeline_3: true,score: 0)
# g9 = Game.create(user_id: u9.id, lifeline_1: true, lifeline_2: true, lifeline_3: true, score: 0)
# g10 = Game.create(user_id: u10.id, lifeline_1: true, lifeline_2: true, lifeline_3: true, score: 0)


# #Questions
# q1 = Question.create(value_of_question: 10, difficulty: "easy", question: "What is the name of the green lady statue in NYC?", correct_answer: "Statue of Liberty", incorrect_answer_1: "Bull", incorrect_answer_2: "Cat", incorrect_answer_3: "Dog")
# q2 = Question.create(value_of_question: 50, difficulty: "medium", question: "Where is Argentina?", correct_answer: "South America", incorrect_answer_1: "Bull", incorrect_answer_2: "Cat", incorrect_answer_3: "Dog")
# q3 = Question.create(value_of_question: 10, difficulty: "easy", question: "Where is Mexico?", correct_answer: "Central America", incorrect_answer_1: "Bull", incorrect_answer_2: "Cat", incorrect_answer_3: "Dog")
# q4 = Question.create(value_of_question: 100, difficulty: "hard", question: "What is the capital of Alaska?", correct_answer: "Juneau", incorrect_answer_1: "Bull", incorrect_answer_2: "Cat", incorrect_answer_3: "Dog")
# q5 = Question.create(value_of_question: 100, difficulty: "hard", question: "What is the capital of Oregon?", correct_answer: "Salem", incorrect_answer_1: "Bull", incorrect_answer_2: "Cat", incorrect_answer_3: "Dog")

# q6 = Question.create(value_of_question: 10, difficulty: "easy", question: "What is the capital of France?", correct_answer: "Paris", incorrect_answer_1: "London", incorrect_answer_2: "Madrid", incorrect_answer_3: "Lyon")
# q7 = Question.create(value_of_question: 10, difficulty: "easy", question: "What is the capital of USA?", correct_answer: "Washington, DC", incorrect_answer_1: "London", incorrect_answer_2: "Madrid", incorrect_answer_3: "Lyon")
# q8 = Question.create(value_of_question: 10, difficulty: "easy", question: "What is the capital of Spain?", correct_answer: "Madrid", incorrect_answer_1: "London", incorrect_answer_2: "Barcelona", incorrect_answer_3: "Lyon")
# q9 = Question.create(value_of_question: 50, difficulty: "medium", question: "What is the capital of Canada?", correct_answer: "Ottawa", incorrect_answer_1: "London", incorrect_answer_2: "Madrid", incorrect_answer_3: "Lyon")
# q10 = Question.create(value_of_question: 100, difficulty: "hard", question: "What is the capital of Australia?", correct_answer: "Canberra", incorrect_answer_1: "London", incorrect_answer_2: "Madrid", incorrect_answer_3: "Lyon")

# #gamequestion

# gq1 = GameQuestion.create(game_id: game1.id, question_id: q4.id, correct_answer: q4.correct_answer)
# gq2 = GameQuestion.create(game_id: game2.id, question_id: q3.id, correct_answer: q3.correct_answer)
# gq3 = GameQuestion.create(game_id: game3.id, question_id: q2.id, correct_answer: q2.correct_answer)
# gq4 = GameQuestion.create(game_id: game4.id, question_id: q1.id, correct_answer: q1.correct_answer)
# gq5 = GameQuestion.create(game_id: game4.id, question_id: q5.id, correct_answer: q5.correct_answer)


# gq6 = GameQuestion.create(game_id: g6.id, question_id: q6.id, correct_answer: q6.correct_answer)
# gq7 = GameQuestion.create(game_id: g7.id, question_id: q7.id, correct_answer: q7.correct_answer)
# gq8 = GameQuestion.create(game_id: g8.id, question_id: q8.id, correct_answer: q8.correct_answer)
# gq9 = GameQuestion.create(game_id: g9.id, question_id: q9.id, correct_answer: q9.correct_answer)
# gq10 = GameQuestion.create(game_id: g10.id, question_id: q10.id, correct_answer: q10.correct_answer)
