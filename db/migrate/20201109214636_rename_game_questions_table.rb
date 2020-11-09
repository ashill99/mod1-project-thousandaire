class RenameGameQuestionsTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :gamequestions, :game_questions
  end
end
