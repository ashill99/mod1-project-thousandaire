class GameQuestion < ActiveRecord::Base 

    belongs_to :question
    belongs_to :game 
    
end 