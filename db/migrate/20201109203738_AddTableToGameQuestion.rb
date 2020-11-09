class AddTableToGameQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :gamequestions do |t|
      t.integer :game_id
      t.integer :question_id
      t.integer :correct_answer
    end
  end
end
