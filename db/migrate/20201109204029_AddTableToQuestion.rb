class AddTableToQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :value_of_question
      t.string :difficulty
      t.question :difficulty
      t.string :correct_answer 
      t.string :incorrect_answer_1
      t.string :incorrect_answer_2
      t.string :incorrect_answer_3
  end
end
