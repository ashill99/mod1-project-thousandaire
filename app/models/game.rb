class Game < ActiveRecord::Base

    belongs_to :user 
    has_many :game_questions 
    has_many :questions, through: :game_questions

end