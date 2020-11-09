class CreateGamesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.boolean :lifeline_1
      t.boolean :lifeline_2
      t.boolean :lifeline_3
    end 
  end
end
