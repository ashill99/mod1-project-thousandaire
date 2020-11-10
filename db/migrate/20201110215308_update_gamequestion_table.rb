class UpdateGamequestionTable < ActiveRecord::Migration[5.2]
  def change
    change_table :game_questions do |t|
      t.change :correct_answer, :string
    end 
  end
end
