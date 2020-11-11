class AddClifelinesToGamequestions < ActiveRecord::Migration[5.2]
  def change
    add_column :game_questions, :lifeline_1, :boolean
    add_column :game_questions, :lifeline_2, :boolean 
    add_column :game_questions, :lifeline_3, :boolean 
  end
end
