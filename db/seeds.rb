



u6 = User.create(username: "A", password: "1234")
u7 = User.create(username: "B", password: "1235")
u8 = User.create(username: "C", password: "1236")
u9 = User.create(username: "D", password: "1237")
u10 = User.create(username: "E", password: "1238")

q6 = Question.create(value_of_question: 10, diffcicult: "easy", question: "What is the capital of France?", correct_answer: "Paris", incorrect_answer_1: "London", incorrect_answer_2: "Madrid", incorrect_answer_3: "Lyon")
q7 = Question.create(value_of_question: 10, diffcicult: "easy", question: "What is the capital of USA?", correct_answer: "Washington, DC", incorrect_answer_1: "London", incorrect_answer_2: "Madrid", incorrect_answer_3: "Lyon")
q8 = Question.create(value_of_question: 10, diffcicult: "easy", question: "What is the capital of Spain?", correct_answer: "Madrid", incorrect_answer_1: "London", incorrect_answer_2: "Barcelona", incorrect_answer_3: "Lyon")
q9 = Question.create(value_of_question: 50, diffcicult: "medium", question: "What is the capital of Canada?", correct_answer: "Ottawa", incorrect_answer_1: "London", incorrect_answer_2: "Madrid", incorrect_answer_3: "Lyon")
q10 = Question.create(value_of_question: 100, diffcicult: "hard", question: "What is the capital of Australia?", correct_answer: "Canberra", incorrect_answer_1: "London", incorrect_answer_2: "Madrid", incorrect_answer_3: "Lyon")

g6 = Game.create(user_id: u6.id, lifeline_1: true, lifeline_2: true, lifeline_3: true)
g7 = Game.create(user_id: u7.id, lifeline_1: true, lifeline_2: true, lifeline_3: true)
g8 = Game.create(user_id: u8.id, lifeline_1: true, lifeline_2: true, lifeline_3: true)
g9 = Game.create(user_id: u9.id, lifeline_1: true, lifeline_2: true, lifeline_3: true)
g10 = Game.create(user_id: 105.id, lifeline_1: true, lifeline_2: true, lifeline_3: true)

gq6 = GameQuestion.create(game_id: g6.id, question_id: q6.id, correct_answer: 0)
gq7 = GameQuestion.create(game_id: g7.id, question_id: q7.id, correct_answer: 0)
gq8 = GameQuestion.create(game_id: g8.id, question_id: q8.id, correct_answer: 0)
gq9 = GameQuestion.create(game_id: g9.id, question_id: q9.id, correct_answer: 0)
gq10 = GameQuestion.create(game_id: g10.id, question_id: q10.id, correct_answer: 0)

