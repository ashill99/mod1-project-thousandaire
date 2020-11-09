User.destroy_all
Game.destroy_all
Question.destroy_all
GameQuestion.destroy_all 


chelsey = User.create(name: "Chelsey", password: "1234")
jimmy = User.create(name: "Jimmy", password: "5678")
jackie = User.create(name: "Jackie", password: "9090")
erica = User.create(name: "Erica", password: "4332")

game1 = Game.create(user_id: chelsey.id, lifeline_1: true, lifeline_2: true, lifeline_3: true )
game2 = Game.create(user_id: jimmy.id, lifeline_1: true, lifeline_2: true, lifeline_3: true )
game3 = Game.create(user_id: jackie.id, lifeline_1: true, lifeline_2: true, lifeline_3: true )
game4 = Game.create(user_id: jimmy.id, lifeline_1: true, lifeline_2: true, lifeline_3: true )
game5 = Game.create(user_id: erica.id, lifeline_1: true, lifeline_2: true, lifeline_3: true )

q1 = Question.create(value_of_question: 10, difficulty: "easy", question: "What is the name of the green lady statue in NYC?", correct_answer: "Statue of Liberty", incorrect_answer_1: "Bull", incorrect_answer_2: "Cat", incorrect_answer_3: "Dog")
q2 = Question.create(value_of_question: 10, difficulty: "medium", question: "Where is Argentina?", correct_answer: "South America", incorrect_answer_1: "Bull", incorrect_answer_2: "Cat", incorrect_answer_3: "Dog")
q3 = Question.create(value_of_question: 10, difficulty: "easy", question: "Where is Mexico?", correct_answer: "Central America", incorrect_answer_1: "Bull", incorrect_answer_2: "Cat", incorrect_answer_3: "Dog")